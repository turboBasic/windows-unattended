Set-Culture uk-UA
Set-WinSystemLocale uk-UA
$1 = New-WinUserLanguageList en-US
$1.Add("uk-UA")
Set-WinUserLanguageList $1 -force
Set-WinHomeLocation 0xF1
$RegKey = "HKCU:\Keyboard Layout\Toggle"
Set-ItemProperty -path $RegKey -name HotKey -value "2"
Set-ItemProperty -path $RegKey -name "Language HotKey" -value "2"
Set-ItemProperty -path $RegKey -name "Layout HotKey" -value "3"

$RegKey = "HKCU:\Control Panel\International"
Set-ItemProperty -path $RegKey -name sDecimal -value "."
Set-ItemProperty -path $RegKey -name sMonDecimalSep -value "."


# OEM Information for System properties dialog

cp TrinacriaOEM.bmp C:\Windows\OEMLogo.BMP
$RegKey = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\OEMInformation"
Set-ItemProperty -path $RegKey -name  Logo         -value "C:\Windows\OEMlogo.bmp"
Set-ItemProperty -path $RegKey -name  Manufacturer -value "Berkovets Brotherhood"
Set-ItemProperty -path $RegKey -name  Model        -value "BIG BRO"
Set-ItemProperty -path $RegKey -name  SupportHours -value "00:00 - 24:00"
Set-ItemProperty -path $RegKey -name  SupportPhone -value "ask Max"
Set-ItemProperty -path $RegKey -name  SupportUrl   -value "https://www.facebook.com/Берковецкое-братство-175435306115/"


# TrueType fonts in console

$RegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"
Set-ItemProperty -path $RegKey -name  000         -value "Anonymous Pro"
Set-ItemProperty -path $RegKey -name  0000        -value "Meslo LG S DZ"
Set-ItemProperty -path $RegKey -name  00000       -value "InputMonoNarrow Light"
Set-ItemProperty -path $RegKey -name  000000      -value "InputMonoCondensed Light"
Set-ItemProperty -path $RegKey -name  0000000     -value "InputMono ExLight"
Set-ItemProperty -path $RegKey -name  00000000    -value "InputMonoNarrow"
Set-ItemProperty -path $RegKey -name  000000000   -value "InputMonoCondensed"
Set-ItemProperty -path $RegKey -name  0000000000  -value "InputMono"

$cScriptLocation = "c:\$install\03_configure_international_settings"
if (!(Test-path $cScriptLocation)) { 
    New-Item -ItemType directory -Path $cScriptLocation
}
if ((Get-Location) -ne $cScriptLocation) {
	cp ".\Berkovets Layout" $cScriptLocation
	cp ".\KMSAuto.Net.2015.v1.4.0.Portable" $cScriptLocation
	cp $MyInvocation.MyCommand.Definition $cScriptLocation	# copy myself to destination computer
}

