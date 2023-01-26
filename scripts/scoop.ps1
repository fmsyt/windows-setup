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
scoop bucket add main
scoop bucket add extras
scoop bucket add versions
scoop bucket add nerd-fonts

scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json


# Scoop�̃C���X�g�[���f�B���N�g���擾
$SCOOP_ROOT = if ($env:SCOOP) {$env:SCOOP} else {"$home\scoop"}

scoop install `
  cpu-z `
  crystaldiskinfo `
  hwmonitor `
  mp3tag `
  notion `
  vim `
  vncviewer `
  oh-my-posh

sudo scoop install -g Cascadia-Code `
  CascadiaCode-NF
