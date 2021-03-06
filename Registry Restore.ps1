Clear
$ErrorActionPreference = "SilentlyContinue"
$RestoreFolder = "$PSScriptRoot\Restore"

if(Test-Path $RestoreFolder){
    Remove-Item -Path $RestoreFolder -Recurse -Force | Out-Null
    Write-Host "Folder `"" -NoNewline
    Write-Host $RestoreFolder -NoNewline -ForegroundColor Green
    Write-Host "`" was deleted!"
}
New-Item -Path $RestoreFolder -ItemType Directory | Out-Null
Write-Host "Created `"" -NoNewline
Write-Host $RestoreFolder -NoNewline -ForegroundColor Green
Write-Host "`" folder!"

if((Test-Path $RestoreFolder) -eq $true){

    $PATHS = @(
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration"
        "HKEY_LOCAL_MACHINE\SYSTEM\Maps"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Siuf\Rules"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\Windows Error Reporting"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Remote Assistance"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
        "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Power"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\TaskManager"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\People"
        "HKEY_USERS\.DEFAULT\Control Panel\Keyboard"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"
        "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Feeds"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer"
        "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys"
        "HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Personalization"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
        "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\AppHost"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\FileHistory"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Maps"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Notifications\Settings"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GameDVR"
        "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys"
        "HKEY_CURRENT_USER\Control Panel\Accessibility\Keyboard Response"
        "HKEY_CURRENT_USER\Control Panel\Accessibility\ToggleKeys"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling"
        "HKEY_CURRENT_USER\System\GameConfigStore"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power"
        "HKEY_CURRENT_USER\Control Panel\Desktop"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\943c8cb6-6f93-4227-ad87-e9a3feec08d1"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\2a737441-1930-4402-8d77-b2bebba308a3\d4e98f31-5ffe-4ce1-be31-1b38b384c009\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\381b4222-f694-41f0-9685-ff5bb260df2e"
        "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\54533251-82be-4824-96c1-47b60b740d00\3b04d4fd-1cc7-4f23-ab1c-d1337819c4bb\DefaultPowerSchemeValues\8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Personalization\Settings"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\InputPersonalization"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"
        "HKEY_CURRENT_USER\SOFTWARE\Policies\Microsoft\Windows\Explorer"
        "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications"
        "HKEY_CURRENT_USER\Control Panel\Desktop"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        "HKEY_CURRENT_USER\Control Panel\Keyboard"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\DWM"
        "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
        "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        "HKEY_LOCAL_MACHINE\Software\Microsoft\WindowsUpdate\UX\Settings"
        "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
    )
    $PATHS | Get-Unique -AsString | ForEach-Object{
        [Int]$RandomNumber = Get-Random -Minimum 10 -Maximum 200000
        if(Test-Path (Join-Path -Path $RestoreFolder -ChildPath "$RandomNumber.reg")){
            $RandomNumber = $RandomNumber + (Get-Random -Minimum 10 -Maximum 160220)
        }
        $File = Join-Path -Path $RestoreFolder -ChildPath "$RandomNumber.reg"
        $String = $_.ToString() 
        reg export $String $File
        Write-Host "File `"" -NoNewline
        Write-Host $File -NoNewline -ForegroundColor Green
        Write-Host "`" was created"
    }
} 
