# Add and Configure Azure DevOps Nuget Feed

Azure DevOps provides company and individuals to host their own Custom Nuget Feeds that require an authentication.
The first step is to configure the authentication based on a custom token then add the feed to the list of the available sources.

.NET Core supports these two options for restoring packages:

- `Nuget.exe` has been used with previous version of .NET framework.
- `dotnet restore` cli comes with build in functionality as well.

### Nuget.Config
In both cases we can use `Nuget.Config` file to add feeds configuration information. We can configure this information on [Project/User/Computer levels](https://docs.microsoft.com/en-us/nuget/consume-packages/configuring-nuget-behavior).

Here an example of `Nuget.Config` file:

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <config>
    <add key="repositoryPath" value="packages" />
  </config>
 <packageSources>
  <add key="nuget.org" value="https://api.nuget.org/v3/index.json" protocolVersion="3" /> 
  <add key="AzurePackages" value="https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json" />
 </packageSources>
 <packageSourceCredentials>
    <AzurePackages>
    <add key="Username" value="vsts" />
    <add key="ClearTextPassword" value="{key}" />
    </AzurePackages>
 </packageSourceCredentials>
</configuration>
```

### Project Props file

`dotnet` cli can be configured using project `props` like this:

```xml
    <Project>
      <Import Project="$(DotNetRestoreSourcePropsPath)" Condition="'$(DotNetRestoreSourcePropsPath)' != ''"/>
      <PropertyGroup Label="RestoreSources">
        <RestoreSources>$(DotNetRestoreSources)</RestoreSources>
        <RestoreSources Condition="'$(DotNetBuildOffline)' != 'true'">
          $(RestoreSources);
          https://api.nuget.org/v3/index.json;
          https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json;
        </RestoreSources>
      </PropertyGroup>
    </Project>
```

## Generate Person Access Token (PAT) for Azure DevOps

1. Log in Azure DevOps and navigate to the Personal Access Token Page (https://{company}.visualstudio.com/_usersSettings/tokens)

2. Create a New Token

 - Name it `Nuget Token - {custom}`

 - Update custom expiration based on your preferences

 - Assign Custom Scope to  `Packaging` Read
 
 - Make sure you keep the copy of it in a safe place

[Azure Artifacts Credential Provider](#cred-provider) will cache token for you.

## Configuring Azure DevOps Custom Nuget Feed on Windows 10

If you don't have `nuget.exe` installed in the local path then use step one to set it up.
1. Install `Nuget.exe` to the global path by

Run `cmd.exe` As Administrator

```cmd
    choco install nuget.commandline --version 4.9.1
```

2. Run the commands based on your authentication preferences of PAT

```cmd
    #add without authentication
    nuget.exe sources Add -Name "azure-packages" -Source "https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json"
    
    #add with authentication
    nuget.exe sources Add -Name "azure-packages" -Source "https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json" -Username "vsts" -Password "{key}"
```
3. It is possible to directly add and modify sources by opening `Nuget.Config` file. Global User configuration file can be found at:

```cmd
    %UserProfile%\AppData\Roaming\Nuget
```

4. Better credietial management is thru storing your credential by [Installing Azure Artifacts Credential Provider](https://github.com/Microsoft/artifacts-credprovider)

- [Run the powershell script](https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.ps1)

- Then restore nuget packages in an interactive mode:

```cmd
    dotnet restore  MyProject.sln --interactive
```
- Interactive mode will display the following will be in the commandline

```cmd
      [CredentialProvider]DeviceFlow: https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json
      [CredentialProvider]To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code {CODE} to authenticate.
```

## On WSL

Install Nuget

```
    sudo apt install nuget
```

[Install Azure Artifacts Credential Provider](https://github.com/Microsoft/artifacts-credprovider)

```
    wget -qO- https://raw.githubusercontent.com/Microsoft/artifacts-credprovider/master/helpers/installcredprovider.sh | bash

```
Add To Bash Environment variable

```bash
    vi ~/.bashrc
    
    # add the following
    
export VSS_NUGET_EXTERNAL_FEED_ENDPOINTS='{"endpointCredentials": [{"endpoint":"https://{company}.pkgs.visualstudio.com/_packaging/{feed}/nuget/v3/index.json", "username":"optional", "password":"{password}"}]}'

```


Add PAT Environment variable by replacing `{key}` value.

```powershell
    $Env:PAT="{key}"
```