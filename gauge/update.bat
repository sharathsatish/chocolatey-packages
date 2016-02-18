findstr "<version>" gauge.nuspec | cut -f2 -d "<" | cut -f 2 -d ">" > tmp.txt
set /p old_version= < tmp.txt
powershell "(Get-Content .\tools\chocolateyInstall.ps1) | ForEach-Object { $_ -replace '%old_version%', '%1' } | Set-Content .\tools\chocolateyInstall.ps1"
powershell "(Get-Content .\gauge.nuspec) | ForEach-Object { $_ -replace '%old_version%', '%1' } | Set-Content .\gauge.nuspec"
powershell "cpack"
@rem git add tools gauge.nuspec
@rem git commit -m "gauge %2"
@rem git push origin master
@rem choco push gauge.%2.nupkg
del tmp.txt
