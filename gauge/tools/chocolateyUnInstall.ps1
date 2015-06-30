$gauge_root = [Environment]::GetEnvironmentVariable("GAUGE_ROOT","Machine")
$updateExe = Join-Path $gauge_root "uninst.exe"
 
Start-Process -FilePath $updateExe -ArgumentList "/S" -Verb "RunAs" -Wait

try{
  [Environment]::SetEnvironmentVariable("GAUGE_ROOT",$null,"Machine")
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw
}