# A PowerShell script that adds Secret and SSL Certificate to the Windows machine
# More: https://github.com/kdcllc/win10andwsldev/blob/master/vsnet-docker-ssl-issue.md
# Get-ExecutionPolicy
# powershell.exe -ExecutionPolicy Bypass

param (
    [Parameter(Mandatory=$true)][string]$project,
    [switch]$docker

 )

$Env:Guid

$xml=New-Object XML
$xml.Load($project)
$secretNode = $xml.Project.PropertyGroup.UserSecretsId
if ($secretNode -eq $null) {
    
    $Env:Guid=New-Guid
    Write-Host "Generated GUID for the UserSecretsId PropertyGroup: " $Env:Guid

	$secretNode = $xml.CreateElement("UserSecretsId")
	$xml.Project.PropertyGroup.AppendChild($secretNode)
	Write-Host "UserSecrets XML tag added to the csproj" -ForegroundColor Green

    $xml.Project.PropertyGroup.UserSecretsId = $Env:Guid

    $xml.Save($project)
}

$Env:Guid = $xml.Project.PropertyGroup.UserSecretsId
Write-Host "Using the following GUID" $Env:Guid -ForegroundColor Green


dotnet user-secrets set "Kestrel:Certificates:Development:Password" $Env:Guid --project $project
$projectName = [System.IO.Path]::GetFileNameWithoutExtension($project)

if($docker){
    $dockerPath = "/root/.aspnet/https/" + $projectName + ".pfx"
    dotnet user-secrets set "Kestrel:Certificates:Development:Path" $dockerPath --project $project
}

$projectName = [System.IO.Path]::GetFileNameWithoutExtension($project)
$certPath = "$Env:APPDATA\ASP.NET\Https\" + $projectName + ".pfx"
Write-Host "Certificate Location: " $certPath
 
dotnet dev-certs https -ep $certPath -p $Env:Guid

Write-Host "SSL Fixed applied, Blessings"