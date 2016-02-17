powershell "(Get-Content .\tools\chocolateyInstall.ps1) | ForEach-Object { $_ -replace '%1', '%2' } | Set-Content .\tools\chocolateyInstall.ps1"
powershell "(Get-Content .\gauge.nuspec) | ForEach-Object { $_ -replace '%1', '%2' } | Set-Content .\gauge.nuspec"
powershell "cpack"
git add tools gauge.nuspec
git commit -m "gauge %2"
git push origin master
choco push gauge.%2.nupkg
