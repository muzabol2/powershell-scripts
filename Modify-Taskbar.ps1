# MODIFY TASKBAR

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
