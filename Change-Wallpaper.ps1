# Script to change desktop background to solid color or wallpaper

$desktopPath = "HKCU:\Control Panel\Desktop"
$colorsPath = "HKCU:\Control Panel\Colors"

# Check if wallpaper is set
if ((Get-ItemProperty -Path $desktopPath).Wallpaper -ne "") {

    # Set solid color background
    Set-ItemProperty -Path $colorsPath -Name "Background" -Value "24 131 135"
    Set-ItemProperty -Path $desktopPath -Name "Wallpaper" -Value ""
    Write-Host "Changed to solid color background."
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters

} else {

    # Check if the images folder exists
    $imagePath = "$($env:userprofile)\docs\images"
    if (!(Test-Path $imagePath)) {
        Write-Host "Error: The images folder does not exist."
        exit
    }
    # Get random image from the images folder
    $images = Get-ChildItem $imagePath -Filter *.jpg
    $randomImage = $images | Get-Random
    # Set wallpaper
    set-itemproperty -path $desktopPath -name "wallpaperstyle" -value "0"
    set-itemproperty -path $desktopPath -name "wallpaper" -value $randomImage.FullName
    Set-ItemProperty -Path $desktopPath -Name "PicturePosition" -Value "2"
    Write-Host "Changed to wallpaper $($randomImage.Name)."
    RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters -force

}
