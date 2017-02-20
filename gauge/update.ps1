param([string]$version='')

if ($version -eq '') {
    throw "Usage: update.ps1 -version <version>"
}

$nuspecPath=".\gauge.nuspec"
$installScriptPath=".\tools\chocolateyInstall.ps1"
$xmlContent = [xml](Get-Content($nuspecPath))
$oldVersion=$xmlContent.package.metadata.version
$xmlContent.package.metadata.version = $version
Resolve-Path($nuspecPath) | %{$xmlContent.Save($_)}

(Get-Content $installScriptPath) -replace $oldVersion, $version | Set-Content $installScriptPath

cpack
git add tools gauge.nuspec
git commit -m "gauge $($version)"
git push origin master
choco push "gauge.$($version).nupkg" -k="$env:apiKey"