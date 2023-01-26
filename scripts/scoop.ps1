##################################################
# install Scoop
##################################################
# インストールディレクトリの設定 (user)
#$env:SCOOP='D:\Applications\Scoop'
#[Environment]::SetEnvironmentVariable('SCOOP', $env:SCOOP, 'User')

# インストールディレクトリの設定 (global)
#$env:SCOOP_GLOBAL='D:\GlobalScoopApps'
#[Environment]::SetEnvironmentVariable('SCOOP_GLOBAL', $env:SCOOP_GLOBAL, 'Machine')

try {
  # Scoopのインストール確認
  get-command scoop -ErrorAction Stop
}
catch [Exception] {
  # Scoopのインストール
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


# Scoopのインストールディレクトリ取得
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
