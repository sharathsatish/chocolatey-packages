$gauge_root = [Environment]::GetEnvironmentVariable("GAUGE_ROOT","Machine")
$updateExe = Join-Path $gauge_root "uninst.exe"
 
Start-Process -FilePath $updateExe -ArgumentList "/S" -Verb "RunAs" -Wait