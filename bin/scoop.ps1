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
scoop bucket add extras
scoop bucket add versions

# Scoopのインストールディレクトリ取得
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

