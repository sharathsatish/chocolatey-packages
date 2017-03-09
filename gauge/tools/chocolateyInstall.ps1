$packageName = 'gauge'
$installerType = 'exe'
$version = $env:version
$url = "https://github.com/getgauge/gauge/releases/download/v{$version}/gauge-${version}-windows.x86.exe"
$url64 = "https://github.com/getgauge/gauge/releases/download/v{$version}/gauge-${version}-windows.x86_64.exe"
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
