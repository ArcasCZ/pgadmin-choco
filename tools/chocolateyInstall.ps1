$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'pgadmin4'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64         = 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v8.5/windows/pgadmin4-8.5-x64.exe'
$checksum64    = 'dff39bd4792d10d1f0512aa2292f14ba2ddeed880b3107c477a92ae0dc2d73b2'
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
