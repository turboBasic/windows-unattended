echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log

choco upgrade -y -pre chocolatey   >> d:\devbot.log

echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log