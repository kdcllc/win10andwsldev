# Visual Studio.NET and Docker issue with SSL Certificates

1. Docker -> Volume -> `%APPDATA%\ASP.NET\Https\<project_name>.pfx` 
2. Docker -> Volume -> `%APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json`

Projects must contains `UserSecretsId` element with unique ID which in turned is used to Encrypt the `.pfx` file and corresponds to proper `secrets.json` location. 

Run [dotnet-core-docker-ssl-fix.ps1](./dotnet-core-docker-ssl-fix.ps1)  with the following to fix the issue:
```ps
    .\dotnet-core-docker-ssl-fix.ps1 -docker  -project C:\Dev\Projects\TestMvCProj2\TestMvCProj2.csproj
```

The following is added or updated based on the `UserSecretsId` in secret.json.
```json
    {
        "Kestrel:Certificates:Development:Password": "<user_secrets_id>",
        "Kestrel:Certificates:Development:Path": {"/root/.aspnet/https/<project_name>.pfx"}
    }
```

In addition the certificate is regenerated with new password `{UserSecretsId}` Id.

## Manual fix for Docker compose and Visual Studio.NET

1. Update User Secrets with project information.

```json
    "Kestrel:Certificates:Development:Password": "<user_secrets_id>",
    "Kestrel": {
        "Certificates": {
            "Default": {
                "Path": "/root/.aspnet/https/<project_name>.pfx",
                "Password": "<user_secrets_id>"
            }
        }
    }
```

2. Update and run this from command-line

```cmd
    dotnet dev-certs https -ep C:\Users\<user>\AppData\Roaming\ASP.NET\Https\<project_name>.pfx -p <user_secrets_id>
```
