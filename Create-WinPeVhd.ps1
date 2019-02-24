$vhdPath = ".\dist\WinPE.vhdx"
$vhdTempPath = "c:\Temp\WinPE.vhdx"
$prefix = "${env:ProgramFiles(x86)}\Windows Kits\10\Assessment and Deployment Kit\Windows Preinstallation Environment"
$env:WinPERoot = $prefix
$env:OSCDImgRoot = "$prefix\..\Deployment Tools\AMD64\Oscdimg"

if( Test-Path C:\WinPE_amd64 ) {
  Write-Verbose "C:\WinPE_amd64 exists!"
  Return
} else {
  & "$prefix\copype" amd64 C:\WinPE_amd64
}

$Partition = New-VHD -Path $vhdTempPath -SizeBytes 2GB -Dynamic | 
             Mount-VHD -Passthru |
             Initialize-Disk -PartitionStyle MBR -Passthru | 
             New-Partition -AssignDriveLetter -UseMaximumSize 
$Drive = $Partition.DriveLetter.ToString()
Format-Volume -DriveLetter $Drive -FileSystem FAT32 -NewFileSystemLabel "Win10 PE" -Confirm:$False -Force
Set-Partition -DriveLetter $Drive -IsActive $True
& dism /Apply-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /Index:1 "/ApplyDir:${Drive}:\"
BCDboot "${Drive}:\Windows" /s "${Drive}:" /f ALL
Dismount-VHD -Path $vhdTempPath
mv $vhdTempPath $vhdPath
