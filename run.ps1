$TempFile = New-TemporaryFile
$WebClient = New-Object System.Net.WebClient
Invoke-WebRequest -Uri "https://github.com/ethanbayliss/rads" -OutFile $TempFile

$PlayWav=New-Object System.Media.SoundPlayer
$PlayWav.SoundLocation=$TempFile
$PlayWav.playsync()

#pause media

#make a note of current volume level

#lower/raise volume to 20%

#play sound

#return volume to previous setting