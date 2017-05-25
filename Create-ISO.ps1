param ($ISOfolder, $ISOfile)

$PathToOscdimg = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\"

$BootData = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f "$ISOfolder\boot\etfsboot.com", "$ISOfolder\efi\Microsoft\boot\efisys.bin"
echo $BootData
echo @("-bootdata:$BootData",'-u2','-udfver102',"$ISOfolder","$ISOFile")
$Proc = Start-Process -FilePath "$PathToOscdimg\oscdimg.exe" -ArgumentList  @("-bootdata:$BootData",'-u2','-udfver102',"$ISOfolder","$ISOFile") -PassThru -Wait -NoNewWindow
