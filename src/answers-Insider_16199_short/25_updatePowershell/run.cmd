echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log

choco upgrade -y -pre powershell   >> d:\devbot.log     >> d:\devbot.log

echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log