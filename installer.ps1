# Install choco first:
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
#############################################################
# Custom Win10 settings:
#############################################################
# Power & Sleep
Powercfg /Change monitor-timeout-dc 5
Powercfg /Change monitor-timeout-ac 10
Powercfg /Change standby-timeout-dc 15
Powercfg /Change standby-timeout-ac 30
#############################################################
# Switch display onto this monitor
displayswitch.exe /extend 	# Extend screen
# displayswitch.exe /internal 	# Disconnect projector
# displayswitch.exe /clone 	    # Duplicate screen
# displayswitch.exe /external 	# Projector only (disconnect local)

#############################################################
# Dark/light mode
$ThemePath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$DarkMode = 0   # $LightMode = 1
Set-ItemProperty -Path $ThemePath -Name AppsUseLightTheme -Value $DarkMode
#############################################################
# Hide the desktop icons
$ExplorerPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
Set-ItemProperty -Path $ExplorerPath -Name "HideIcons" -Value 1
Get-Process "explorer" | Stop-Process
#############################################################
# MODIFY TASKBAR
#############################################################
# Remove search box from taskbar
$SearchPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
Set-ItemProperty -Path $SearchPath -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force
Get-Process "explorer" | Stop-Process
#############################################################
# Remove weather and news from taskbar
$FeedsPath = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds"
$NoNews = 2     # $YesNews = 1
Set-ItemProperty -Path $FeedsPath -Name "ShellFeedsTaskbarViewMode" -Value $NoNews
Get-Process "explorer" | Stop-Process
#############################################################
# change color of wallpaper
#############################################################
# Install applications:
choco install vscode -y
choco install nodejs -y
choco install nvm -y
choco install git -y
choco install github-desktop -y

choco install docker-desktop -y
choco install sql-server-management-studio -y

choco install googlechrome -y
choco install firefox -y
choco install adobereader -y

choco install notepadplusplus -y
choco install poshgit -y
choco install microsoft-windows-terminal -y
# choco install vlc -y
# choco install postgresql -y
# choco install office365proplus -y
# choco install qbittorrent -y