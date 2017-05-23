iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex

%ChocolateyInstall%\tools\shimgen -o="..\bin\shimgen.exe" -p="..\tools\shimgen.exe"  
[Environment]::SetEnvironmentVariable("Choco", "%ChocolateyInstall%", "User")

cinst powershell         -y -pre
cinst chocolatey         -y -pre
cinst 7zip.install       -y
cinst streams            -y
