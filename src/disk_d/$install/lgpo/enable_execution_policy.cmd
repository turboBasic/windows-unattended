copy lgpo.exe %windir%\system32
lgpo.exe /m .\powershell_policies\machine_registry.pol
lgpo.exe /u .\powershell_policies\user_registry.pol
                                                          


