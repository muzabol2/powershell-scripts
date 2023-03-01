Get-PSDrive | 
Where-Object{$_.Free -gt 1} |
ForEach-Object{$Count = 0; Write-Host "";} `
{ $_.Name + ": Used: " + "{0:N2}" -f ($_.Used/1gb) + `
" Free: " + "{0:N2}" -f ($_.free/1gb) + `
" Total: " + "{0:N2}" -f (($_.Used/1gb)+($_.Free/1gb)); `
$Count = $Count + $_.Free;}{Write-Host"";Write-Host "Total Free Space " ("{0:N2}" -f ($Count/1gb)) -backgroundcolor magenta}