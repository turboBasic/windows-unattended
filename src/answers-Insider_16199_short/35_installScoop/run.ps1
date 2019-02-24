

[Environment]::SetEnvironmentVariable("Scoop",        "%USERPROFILE%\scoop", "User")
[Environment]::SetEnvironmentVariable("Scoop_Global", "%PROGRAMDATA%\scoop", "Machine")

iwr https://get.scoop.sh -UseBasicParsing | iex


