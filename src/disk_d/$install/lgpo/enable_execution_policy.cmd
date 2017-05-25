SET p=%~dp0
copy %p%\lgpo.exe %windir%\system32
lgpo.exe /m %p%\powershell_policies\machine_registry.pol
lgpo.exe /u %p%\powershell_policies\user_registry.pol
                                                          


