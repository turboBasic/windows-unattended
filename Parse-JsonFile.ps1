param ([string]$file)

$hashtable = @{}
$oldEAP = $ErrorActionPreference

Try {
  $ErrorActionPreference = "Stop"
  $text = Get-Content $file
} Catch {
  Write-Host "Cannot read from $file"
  return $hastable
} Finally {
  $ErrorActionPreference = $oldEAP
}

($text -join "`n" | convertfrom-json).psobject.properties | foreach { $hashtable[$_.Name] = $_.Value }

return $hashtable;