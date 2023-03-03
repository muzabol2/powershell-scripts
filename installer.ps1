#############################################################
# WINDOWS 10 - CUSTOMIZE:
#############################################################
#############################################################
# MODIFY TASKBAR
#############################################################
# Remove search box from taskbar
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchBoxTaskbarMode -Value 0 -Type DWord -Force
Get-Process "explorer" | Stop-Process
# Remove weather and news from taskbar
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds -Name "ShellFeedsTaskbarViewMode" -Value 2
Get-Process "explorer" | Stop-Process
# Hide Task View button
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name 'ShowTaskViewButton' -Type 'DWord' -Value 0 
Get-Process "explorer" | Stop-Process
# Hide the desktop icons
Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name "HideIcons" -Value 1
Get-Process "explorer" | Stop-Process
# Dark/light mode
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme -Value 0
Get-Process "explorer" | Stop-Process
# Change color of wallpaper

#############################################################
# Power & Sleep
Powercfg /Change monitor-timeout-dc 5
Powercfg /Change monitor-timeout-ac 10
Powercfg /Change standby-timeout-dc 15
Powercfg /Change standby-timeout-ac 30
# Switch display onto this monitor
DisplaySwitch /extend 	# Extend screen
# /internal 	# Disconnect projector
# /clone 	    # Duplicate screen
# /external 	# Projector only (disconnect local)
#############################################################
# INSTALL PROGRAMS:
#############################################################
# Choco:
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# Applications:
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
choco install vlc -y
# choco install postgresql -y
# choco install office365proplus -y
# choco install qbittorrent -y
