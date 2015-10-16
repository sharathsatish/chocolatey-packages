﻿$packageName = 'gauge'
$installerType = 'exe'
$url = 'https://github.com/getgauge/gauge/releases/download/v0.2.1/gauge-0.2.1-windows.x86.exe'
$url64 = 'https://github.com/getgauge/gauge/releases/download/v0.2.1/gauge-0.2.1-windows.x86_64.exe'
$silentArgs = '/S'
$validExitCodes = @(0)

Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url" "$url64"  -validExitCodes $validExitCodes
