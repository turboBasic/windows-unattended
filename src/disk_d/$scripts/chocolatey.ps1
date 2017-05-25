#iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
                                                                          
#%ChocolateyInstall%\tools\shimgen -o="..\bin\shimgen.exe" -p="..\tools\shimgen.exe"  
#[Environment]::SetEnvironmentVariable("Choco", "%ChocolateyInstall%", "User")
                      
#cinst powershell                        -y -pre
#cinst chocolatey                        -y -pre                                                
#cinst NuGet.CommandLine                 -y
#cinst Microsoft-Windows-Subsystem-Linux -y -source windowsfeatures       
#cinst Microsoft-Hyper-V-All             -y -source windowsFeatures                     
# cinst bash  --allow-empty-checksums -source cygwin  
# cinst babun --allow-empty-checksums -y                       
                                                                          
cinst 7zip.install       -y             # cinst 7zip.portable -version 16.04 -y                            
cinst registrymanager    -y
cinst fab                -y
cinst cmder              -y -pre 
#cinst jre8               -y
cinst rapidee            -y --ignore-checksums
cinst linkshellextension -y --allow-empty-checksums 
cinst vcredist2005 vcredist2008 vcredist2010 vcredist2012 vcredist2013 vcredist2015 -y
cinst streams            -y
# cinst mobaxterm        -y
# cinst hyper            -y
                                   
# cinst docker-for-windows -y -pre        # download Kitematics from https://github.com/docker/kitematic/tags
# cinst virtualbox virtualbox.extensionpack -y --allow-empty-checksums    

#cinst notepadplusplus.install --x86 -y       # -ia "/D=$env:ONEDRIVE_HOME\01_portable_apps\NotepadPlusPlus"
#shim "C:\Program Files (x86)\Notepad++\notepad++.exe" $true npp   # shimgen -o="..\bin\np.exe" -p="%ProgramFiles(x86)%\Notepad++\notepad++.exe"    
#cinst SublimeText3       -y 

#cinst sumatrapdf.install -y 
#cinst inkscape           -y                
#cinst vlc                -y --allow-empty-checksums
#cinst foobar2000         -y --allow-empty-checksums
#cinst fsviewer           -y --allow-empty-checksums 
#cinst skype              -y --allow-empty-checksums   
#cinst qbittorrent        -y --allow-empty-checksums                            
#cinst launchy-beta       -y -pre
#cinst putty              -y 
#cinst kdiff3             -y 
#cinst everything         -y 

#cinst dropbox            -y --allow-empty-checksums
#cinst evernote           -y --allow-empty-checksums  
#cinst calibre            -y

#cinst webstorm phpstorm  -y -pre
#cinst putty              -y
#cinst winscp.portable    -y 
#cinst synctrayzor        -y    # ZAsvgRusYqoXF7ucnm7JvdZESUMrM2sm   K6E7XC2-5FFKHHY-WOPPUFK-7Y24JC5-5PICGGJ-RD4FSAV-W6SSNWE-4WNRFQE
                               # BIGBLACK-STARLINK    JORADGB-6WYCPX7-X3GE75H-X4K4BXP-LUODEIV-J3RJ743-GEJMGHW-2OAFMAH

# cinst yarn -y --ignore-dependencies    # choco uninstall nodejs.install --force
# mkdir %USERPROFILE%\bin
# [Environment]::SetEnvironmentVariable("Path","$env:Path;$env:UserProfile\bin","User")
# yarn config set prefix %USERPROFILE%\bin
# shimgen -o="$env:choco\bin\yarn.exe" -p="c:\Program Files (x86)\Yarn\bin\yarn.cmd"


# cinst wincompose gimp                   -y --allow-empty-checksums 
# cinst peazip                            -y
cinst git-credential-manager-for-windows  -y -I

cinst ketarin      -y