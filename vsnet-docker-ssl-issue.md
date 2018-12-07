# Visual Studio.NET and Docker issue with SSL Certificate

In the development environment Visual Studio.NET generates local ssl certificates to be used for securing the application.

1. There are two locations of these SSL Certificates
- Debug with Kerstel ()
- Debug with Docker (`%APPDATA%\ASP.NET`)

2. UserSecrete location
SSL certificate also depend on UserSecret store to retrieve the appropriate pass as defined in the `docker-compose.override.yml file.

- `%APPDATA%\Microsoft\UserSecrets`


```yml
 volumes:
      - ${APPDATA}/ASP.NET/Https:/root/.aspnet/https:ro
      - ${APPDATA}/Microsoft/UserSecrets:/root/.microsoft/usersecrets:ro
```

```cmd
    dotnet dev-certs https -ep $appdata$\ASP.NET\Https\{ProjectName}.pfx -p {UserSecret-GUID}
```

This secret maps the SSL certificate, `kestrel` part is not always needed.
```json
    "Kestrel:Certificates:Development:Password": "{UserSecret-GUID}",
    "Kestrel": {
        "Certificates": {
            "Default": {
                "Path": "/root/.aspnet/https/{ProjectName}.pfx",
                "Password": "{UserSecret-GUID}"
            }
        }
    }
``