#init
$wshShell = new-object -com wscript.shell
Add-Type -AssemblyName presentationCore
$mediaPlayer = New-Object system.windows.media.mediaplayer
Function Set-Speaker($Volume){$wshShell = new-object -com wscript.shell;1..50 | % {$wshShell.SendKeys([char]174)};1..$Volume | % {$wshShell.SendKeys([char]175)}}

#download mp3
$TempFile = New-TemporaryFile
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads/raw/main/scratch.mp3" -OutFile $TempFile
$Mp3 = "$($TempFile.fullname).mp3"
Copy-Item $TempFile.fullname $Mp3

#lower/raise volume to 20%
Set-Speaker -Volume 10

# play a single file
$mediaPlayer.open($Mp3)
$mediaPlayer.Play()