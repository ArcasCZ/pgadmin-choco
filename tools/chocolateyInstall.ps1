$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'pgadmin4'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64         = 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v8.8/windows/pgadmin4-8.8-x64.exe'
$checksum64    = '5af78de115927d35e0652ba8f302ac3e850b97684d06e669b7e710580a6b1610'
$checksumType64= 'sha256'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'

  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /ALLUSERS /SP-' # Inno Setup
  validExitCodes= @(0)

  softwareName  = 'pgAdmin 4'

  url64         = $url64
  checksum64    = $checksum64
  checksumType64= $checksumType64
}

Install-ChocolateyPackage @packageArgs
