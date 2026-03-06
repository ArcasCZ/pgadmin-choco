$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'pgadmin4'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64         = 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v9.13/windows/pgadmin4-9.13-x64.exe'
$checksum64    = '1EE9F0963BE95628FDA855A99511519720F7E528914221D7CC27353E0A5FA33B'
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
