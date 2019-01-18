# originally from https://github.com/shanselman/RemoveDotNetCoreSDKInstallers/blob/master/RemoveCoreSDKs.ps1

$app = Get-WmiObject -Class Win32_Product | Where-Object { 
    $_.Name -match "Microsoft .NET Core SDK" 
}

Write-Host $app.Name 
Write-Host $app.IdentifyingNumber
pushd $env:SYSTEMROOT\System32

$app.identifyingnumber |% { Start-Process msiexec -wait -ArgumentList "/x $_" }

popd