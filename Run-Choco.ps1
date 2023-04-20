# Install choco:
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install applications:
choco install git -y
choco install nvm -y
choco install nodejs -y
choco install vscode -y
choco install github-desktop -y
choco install poshgit -y

choco install googlechrome -y
choco install firefox -y
choco install adobereader -y
choco install notepadplusplus -y
choco install vlc -y
choco install qbittorrent -y
choco install winrar -y

choco install microsoft-windows-terminal -y
choco install office365proplus -y
choco install postgresql -y
choco install docker-desktop -y
choco install sql-server-management-studio -y