# Run script from another one

$location = Get-Location
Write-Host $location
. "$location\Check-TotalFreeSpace.ps1"
