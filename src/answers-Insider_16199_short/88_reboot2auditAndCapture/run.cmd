echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log


%SystemRoot%\System32\Sysprep\Sysprep.exe /generalize /oobe /shutdown /unattend:"d:\$scripts\90_reboot2oobe\generalizeAndCopyProfileAndOOBE.xml"   >> d:\devbot.log

echo %~n0%~x0 >> d:\devbot.log
time /t       >> d:\devbot.log