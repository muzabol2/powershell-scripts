$computerInfo = Get-CimInstance -ClassName Win32_ComputerSystem
$totalPhysicalMemory = $computerInfo.TotalPhysicalMemory
$memoryInMB = [math]::Round($totalPhysicalMemory / 1MB, 2)
$memoryInGB = [math]::Round($totalPhysicalMemory / 1GB, 2)
$processorInfo = Get-CimInstance -ClassName Win32_Processor
$graphicsInfo = Get-CimInstance -ClassName Win32_VideoController
$diskInfo = Get-CimInstance -ClassName Win32_DiskDrive
$operatingSystemInfo = Get-CimInstance -ClassName Win32_OperatingSystem
$soundDeviceInfo = Get-CimInstance -ClassName Win32_SoundDevice
$usbControllerInfo = Get-CimInstance -ClassName Win32_USBController
$batteryInfo = Get-CimInstance -ClassName Win32_Battery
$networkAdapterInfo = Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.Speed -ne $null }

$systemInfo = @{
    "Total Physical Memory" = $memoryInMB, $memoryInGB
    "Processor" = $processorInfo | Select-Object -Property Name, Manufacturer, MaxClockSpeed, NumberOfCores
    "Graphics" = $graphicsInfo | Select-Object -Property Name, AdapterRAM, DriverVersion
    "Disks" = $diskInfo | Select-Object -Property Model, Size, MediaType
    "Operating System" = $operatingSystemInfo | Select-Object -Property Caption, Version, OSArchitecture
    "Sound Device" = $soundDeviceInfo | Select-Object -Property Manufacturer, Name
    "USB Controllers" = $usbControllerInfo | Select-Object -Property Manufacturer, Name
    "Battery" = $batteryInfo | Select-Object -Property Status, Name, EstimatedRunTime
    "Network Adapter" = $networkAdapterInfo | Select-Object -Property Speed, Name, MACAddress
}

Write-Host ""
Write-Host "-----------------------" -ForegroundColor Red
Write-Host "| SYSTEM INFO:        |" -ForegroundColor Red
Write-Host "-----------------------" -ForegroundColor Red
Write-Host ""

foreach ($info in $systemInfo.GetEnumerator()) {
    $propertyName = $info.Key
    $propertyValue = $info.Value
    Write-Host "$propertyName" -ForegroundColor Green
    Write-Host "-----------------------" -ForegroundColor Green
    
    if ($propertyName -eq "Total Physical Memory") {
        Write-Host "MB: $($propertyValue[0])" -ForegroundColor Yellow
        Write-Host "GB: $($propertyValue[1])" -ForegroundColor Yellow
        Write-Host ""
    }
    else {
        $propertyValue | ForEach-Object {
            $_.PSObject.Properties | ForEach-Object {
                Write-Host "$($_.Name): $($_.Value)" -ForegroundColor Yellow
            }
            Write-Host ""
        }
    }
}
Write-Host "" -ForegroundColor White
