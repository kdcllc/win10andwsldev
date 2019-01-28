# Visual Studio.NET and Docker issue with SSL Certificates

1. Docker -> Volume -> `%APPDATA%\ASP.NET\Https\{projectName}.pfx` 
2. Docker -> Volume -> `%APPDATA%\Microsoft\UserSecrets\<user_secrets_id>\secrets.json`

Projects must contains `UserSecretsId` element with unique ID which in turned is used to Encrypt the `.pfx` file and corresponds to proper `secrets.json` location. 

Run [dotnet-core-docker-ssl-fix.ps1](./dotnet-core-docker-ssl-fix.ps1)  with the following to fix the issue:
```ps
    .\dotnet-core-docker-ssl-fix.ps1 -docker  -project C:\Dev\Projects\TestMvCProj2\TestMvCProj2.csproj
```

The following is added or updated based on the `UserSecretsId` in secret.json.
```json
    {
        "Kestrel:Certificates:Development:Password": "{UserSecret-GUID}",
        "Kestrel:Certificates:Development:Path": {"/root/.aspnet/https/{ProjectName}.pfx"}
    }
```

In addition the certificate is regenerated with new password `{UserSecretsId}` Id.

> dotnet dev-certs https -ep C:\Users\{user}\AppData\Roaming\ASP.NET\Https\{Name}.pfx -p 4ce265ef-8194-409f-b691-39b3d107ffd1


%APPDATA%\Microsoft\UserSecrets
%APPDATA%\ASP.NET

Manage Secreate to update to
```json
    "Kestrel:Certificates:Development:Password": "180e7ef9-d46a-4bed-a940-8717061b2b6f",
    "Kestrel": {
        "Certificates": {
            "Default": {
                "Path": "/root/.aspnet/https/{Name}.pfx",
                "Password": "180e7ef9-d46a-4bed-a940-8717061b2b6f"
            }
        }
    }
```
