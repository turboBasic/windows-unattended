$RegKey = "HKCU:\Control Panel\International"
Set-ItemProperty -path $RegKey -name sDecimal -value "."
Set-ItemProperty -path $RegKey -name sMonDecimalSep -value "."

# TrueType fonts in console

$RegKey = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Console\TrueTypeFont"
Set-ItemProperty -path $RegKey -name  00000   -value "InputMono Light"
Set-ItemProperty -path $RegKey -name  00001   -value "InputMonoNarrow"
Set-ItemProperty -path $RegKey -name  00002   -value "InputMono"
Set-ItemProperty -path $RegKey -name  00003   -value "FiraCode"
Set-ItemProperty -path $RegKey -name  00003   -value "FiraCode Light"
