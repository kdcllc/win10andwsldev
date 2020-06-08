# Downloads and Installs Azure Artifacts Credential Provider https://github.com/microsoft/artifacts-credprovider

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope Process

$installFilePath = $PSScriptRoot + "\installcredprovider.ps1"
Write-Host $installFilePath

Invoke-WebRequest https://raw.githubusercontent.com/microsoft/artifacts-credprovider/master/helpers/installcredprovider.ps1 -OutFile $installFilePath
./installcredprovider.ps1 -AddNetfx -Force
