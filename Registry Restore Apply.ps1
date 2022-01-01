Clear
$ErrorActionPreference = "SilentlyContinue"
$RestoreFolder = "$PSScriptRoot\Restore"

Get-ChildItem -Path $RestoreFolder | ForEach-Object{
        
    reg import $_.FullName

}