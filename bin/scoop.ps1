##################################################
# install Scoop
##################################################
# �C���X�g�[���f�B���N�g���̐ݒ� (user)
#$env:SCOOP='D:\Applications\Scoop'
#[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')

# �C���X�g�[���f�B���N�g���̐ݒ� (global)
#$env:SCOOP_GLOBAL='D:\GlobalScoopApps'
#[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

try {
  # Scoop�̃C���X�g�[���m�F
  get-command scoop -ErrorAction Stop
}
catch [Exception] {
  # Scoop�̃C���X�g�[��
  Set-ExecutionPolicy RemoteSigned -scope CurrentUser
  Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')
}

# install basic module
# scoop install aria2
scoop install git
scoop install sudo

# add bucket
scoop bucket add extras
scoop bucket add versions

# Scoop�̃C���X�g�[���f�B���N�g���擾
$SCOOP_ROOT = if ($env:SCOOP) {$env:SCOOP} else {"$home\scoop"}

##################################################
# install vscode
##################################################
# scoop install vscode
# reg import $SCOOP_ROOT\apps\vscode\current\vscode-install-context.reg  # add context menu

# scoop install winscp
# $winscp_version = scoop info winscp | Select-String -Pattern "Version" | %{ $_.Line.Split(" ")[1] }
# Invoke-WebRequest -Uri https://winscp.net/translations/dll/$winscp_version/jp.zip -OutFile $SCOOP_ROOT\apps\winscp\$winscp_version\jp.zip
# Expand-Archive -Force -Path $SCOOP_ROOT\apps\winscp\$winscp_version\jp.zip -DestinationPath $SCOOP_ROOT\apps\winscp\$winscp_version\
# Remove-Item $SCOOP_ROOT\apps\winscp\$winscp_version\jp.zip

# scoop install powertoys

scoop install cpu-z `
  crystaldiskinfo `
  hwmonitor `
  mp3tag `
  notion `
  vncviewer

