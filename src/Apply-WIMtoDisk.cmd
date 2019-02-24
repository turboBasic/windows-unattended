rem == Set high-performance power scheme to speed deployment ==
call powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

rem == Apply the image to the Windows and UserData partitions ==
imagex /apply devbot_disk_c.wim 1 w:
rem Dism /Apply-Image /ImageFile:devbot_disk_c.wim /Index:1 /ApplyDir:w:\
imagex /apply devbot_disk_d.wim 1 d:
rem Dism /Apply-Image /ImageFile:devbot_disk_d.wim /Index:1 /ApplyDir:d:\

rem == Copy boot files to the System partition ==
w:\Windows\System32\bcdboot w:\Windows /s S:

rem == Copy the Windows RE image to the
rem    Windows RE Tools partition ==
md r:\Recovery\WindowsRE
xcopy /h w:\Windows\System32\Recovery\Winre.wim r:\Recovery\WindowsRE\

rem == Register the location of the recovery tools ==
w:\Windows\System32\Reagentc /Setreimage /Path r:\Recovery\WindowsRE /Target w:\Windows

rem == Verify the configuration status of the images. ==
w:\Windows\System32\Reagentc /Info /Target w:\Windows
