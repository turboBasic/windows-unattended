#Mount-DiskImage  ISO ...

$CurrentDir = Split-Path $PSCommandPath

$ISOMediaFolder = "$CurrentDir\_iso_2_workingCopy"

$ISOFile = "$CurrentDir\_iso_2_production\enterprise_1703_x64.unattended.iso"

$PathToOscdimg = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\"

$BootData = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f "$ISOMediaFolder\boot\etfsboot.com", "$ISOMediaFolder\efi\Microsoft\boot\efisys.bin"

$Proc = Start-Process -FilePath "$PathToOscdimg\oscdimg.exe" -ArgumentList @("-bootdata:$BootData",'-u2','-udfver102',"$ISOMediaFolder","$ISOFile") -PassThru -Wait -NoNewWindow
