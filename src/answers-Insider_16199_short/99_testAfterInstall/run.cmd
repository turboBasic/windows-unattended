echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log


echo Running dxdiag
c:\Windows\system32\dxdiag.exe /t %userprofile%\Desktop\dxdiag.log


echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log