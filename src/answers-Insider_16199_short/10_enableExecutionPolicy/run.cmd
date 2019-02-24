echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log
SET p=%~dp0
copy %p%\bin\lgpo.exe %windir%\system32  >> d:\devbot.log

%p%\bin\lgpo.exe /m %p%\powershellPolicies\machine_registry.pol  >> d:\devbot.log
%p%\bin\lgpo.exe /u %p%\powershellPolicies\user_registry.pol     >> d:\devbot.log
                                                          

echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log
