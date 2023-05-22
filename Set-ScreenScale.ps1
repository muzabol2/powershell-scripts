[CmdletBinding()]
param (
    [Parameter(Mandatory=$false)]
    [int]$scaling = 0,

    [Parameter(Mandatory=$false)]
    [int]$screenNum = 1
)

function Set-ScreenScale {
    $typeName = "SystemParamInfo.WinAPICall"
    $type = [System.Reflection.Assembly]::GetExecutingAssembly().GetType($typeName)
    if ($type) {
        Remove-TypeDefinition $typeName
    }

    $source = @"
    [DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, uint pvParam, uint fWinIni);
    "@

    $apicall = Add-Type -MemberDefinition $source -Name WinAPICall -Namespace SystemParamInfo -PassThru
    $apicall::SystemParametersInfo(0x009F, $scaling, [int]$screenNum, 1) | Out-Null

    Write-Host "Screen scale set to $scaling for screen $screenNum"
}

Set-ScreenScale -scaling $scaling -screenNum $screenNum
