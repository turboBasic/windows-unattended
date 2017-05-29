$vhdPath=".\dist\WinPE.vhdx"
$prefix="${env:ProgramFiles(x86)}\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment"
$env:WinPERoot=$prefix
$env:OSCDImgRoot="$prefix\..\Deployment Tools\AMD64\Oscdimg"

& "$prefix\copype" amd64 C:\WinPE_amd64

$Partition = New-VHD -Path $vhdPath -SizeBytes 1GB -Dynamic | Mount-VHD -Passthru |
      Initialize-Disk -Passthru | New-Partition -AssignDriveLetter -UseMaximumSize |
      Format-Volume -FileSystem NTFS -Confirm:$false -Force
$Drive = $Partition.DriveLetter.Tostring() + ":"

& "$prefix\MakeWinPEMedia" /UFD C:\WinPE_amd64 $Drive
