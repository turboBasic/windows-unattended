echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log

SET p=%~dp0
regedit /S %p%\tweaks.reg >> d:\devbot.log

time /t >> d:\devbot.log