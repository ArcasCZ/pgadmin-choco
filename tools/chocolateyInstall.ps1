$ErrorActionPreference = 'Stop'; # stop on all errors

$packageName   = 'pgadmin4'
$toolsDir      = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64         = 'https://ftp.postgresql.org/pub/pgadmin/pgadmin4/v9.6/windows/pgadmin4-9.6-x64.exe'
$checksum64    = 'EAE7E014E2F65B89523D96579B307C7D119C8668B73EF45046739C0833CAB44C'
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
