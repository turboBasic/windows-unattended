#
param( $index = "Insider_Preview_16199" )

$vhdPath  = ".\dist\install.vhdx"
$vhdMount = ".\_vhd"
$installISO = ".\dist\w10_unattended_install.iso"

$config = @{ 
  "Insider_Preview_16199" = "d:\Downloads\Windows Deployment\Windows10_InsiderPreview_EnterpriseVL_x64_en-us_16193.iso"; 
  "Enterprise_1703" = "D:\ISOs\w10_enterprise_1703\en_windows_10_enterprise_version_1703_updated_march_2017_x64_dvd_10189290.unattended-initial.iso" 
}

#$winISO = "d:\Downloads\Windows Deployment\Windows10_InsiderPreview_EnterpriseVL_x64_en-us_16193.iso"
$winISO = $config.get_item($index)
$answers = ".\src\answers-" + $index

$Partition = New-VHD -Path $vhdPath -SizeBytes 6GB -Dynamic | Mount-VHD -Passthru | `
    Initialize-Disk -Passthru | New-Partition -AssignDriveLetter -UseMaximumSize |  `
    Format-Volume -FileSystem NTFS -Confirm:$false -Force 
$Destination = $Partition.DriveLetter.Tostring() + ":\"
7z.exe x -y -o"($Destination)" $winISO

Dism /Capture-Image /ImageFile:.\dist\disk_c.wim /CaptureDir:.\src\disk_c /Name:WindowsConfigs
cp .\dist\disk_c.wim $Destination
Dism /Capture-Image /ImageFile:.\dist\disk_d.wim /CaptureDir:.\src\disk_d /Name:SoftwareInstallation
cp .\dist\disk_d.wim $Destination

cp $answers\BootToAudit.xml "$Destination\Autounattend.xml"

# Create-ISO $Destination  $installISO
Dismount-VHD –Path ".\dist\install.vhdx"



Function Create-ISO ($ISOfolder, $ISOfile) {
  #Mount-DiskImage  ISO ...

  #$CurrentDir = Split-Path $PSCommandPath

  #$mount_params = @{ImagePath = $ISOfile; PassThru = $true; ErrorAction = "Ignore"}
  $PathToOscdimg = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\"

  $BootData = '2#p0,e,b"{0}"#pEF,e,b"{1}"' -f "$ISOfolder\boot\etfsboot.com", "$ISOfolder\efi\Microsoft\boot\efisys.bin"
  echo $BootData
  echo @("-bootdata:$BootData",'-u2','-udfver102',"$ISOfolder","$ISOFile")
  $Proc = Start-Process -FilePath "$PathToOscdimg\oscdimg.exe" -ArgumentList @("-bootdata:$BootData",'-u2','-udfver102',"$ISOfolder","$ISOFile") -PassThru -Wait -NoNewWindow
}


