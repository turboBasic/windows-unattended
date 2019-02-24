echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log

$env:ChocolateyInstall = "${env:ProgramData}\choco"  >> d:\devbot.log
setx Choco %ChocolateyInstall% /M                    >> d:\devbot.log

powershell -command "& { iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex }"   >> d:\devbot.log


echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log