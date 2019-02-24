
$wimPath = "C:\VistaWork\DVD\sources"


# Укажите путь к папке, в которую будет подключен образ
$imageMount = "C:\VistaWork\Mount"

# Укажите путь к файлу с твиками реестра
# Если этот командный файл и REG-файла находятся в одной папке,
# достаточно указать только имя REG-файла
$tweak = "tweaks_hku.reg"



Write-Verbose "Подключение образа"

$parms = @{
  ImagePath = "$wimPath\install.wim";
  Path      = $imageMount;
  Index     = 1;
}

Mount-WindowsImage @parms




Write-Verbose "Импорт твиков реестра"

reg load HKEY_USERS\Custom "$imageMount\Users\Default\NTUSER.DAT"
reg import $tweak
reg unload HKEY_USERS\Custom


Write-Verbose "Отключение образа"

Dismount-WindowsImage -Path $imageMount -Save

Write-Verbose "Операция завершена!"
