gc ..\..\version | %{
    (Get-Content tools\chocolateyInstall.ps1.template).replace('{{version}}', $_) | Set-Content tools\chocolateyInstall.ps1;
    choco pack --version=$_
}
