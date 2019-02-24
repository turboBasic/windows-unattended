PARAM( 
    [String]$configuration = '.\config.json', 
    [String]$iso           = '',
    [String]$wim           = '', 
    [String]$answer        = '' 
)

$vhdPath  =   'c:\temp\install.vhdx'
$vhdMount =   '.\_vhd'
$installISO = '.\dist\w10_unattended_install.iso'

$config = @{}

$tmp = (.\Parse-JsonFile.ps1 $configuration)
'iso', 'answer', 'wim' |
    ForEach-Object { 
      if((Get-Item "Variable:$_").Value){
        $config.$_ = (Get-Item "Variable:$_").Value         
      } else {
        $config.$_ = $tmp.$_
      }
    }

Write-Output $config
Write-Host "Press any key to continue ..."
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

If (!(Test-path $config.iso) -or !(Test-path $config.answer)) {
  Write-Host "Missing information!"
}


if (Test-path $vhdPath) {
  mv $vhdPath "$vhdPath.bak" -force
}

Write-Host @"
New-VHD -Path $vhdPath -SizeBytes 6GB -Dynamic | Mount-VHD -Passthru | Initialize-Disk -Passthru | New-Partition -AssignDriveLetter -UseMaximumSize | Format-Volume -FileSystem NTFS -Confirm:$false -Force

Press any key to continue ...
"@
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

$oldEAP = $ErrorActionPreference
Try {
  $ErrorActionPreference = "Stop"
  $Partition = New-VHD -Path $vhdPath -SizeBytes 6GB -Dynamic | Mount-VHD -Passthru |
      Initialize-Disk -Passthru | New-Partition -AssignDriveLetter -UseMaximumSize |
      Format-Volume -FileSystem NTFS -Confirm:$false -Force
  $Destination = $Partition.DriveLetter.Tostring() + ":\"
} Catch {
  Write-Host "Cannot create VHD"
  $Partition = $null
} Finally {
  $ErrorActionPreference = $oldEAP
}
if(!$Partition) {
  Return 1
}

Write-Host @"
7z.exe x -y -o\"$Destination\" $config.iso

Press any key to continue ...
"@
#$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

$paramstring = 'x', '-y', "-o""$Destination""", $config.iso, '*', '-xr!install.wim'
& 7z.exe $paramstring
cp $config.wim "$Destination\sources"

.\Create-DataDisks.ps1
cp .\dist\disk_c.wim $Destination
cp .\dist\disk_d.wim $Destination

cp $config.answer "$Destination\Autounattend.xml"

# Create-ISO $Destination  $installISO
Dismount-VHD -Path $vhdPath
