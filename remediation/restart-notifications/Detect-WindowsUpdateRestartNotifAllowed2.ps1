# Description: Detection script to verify Windows Update restart notifications are allowed.
# If the registry value does not exist or is not set to 1, the script exits with code 1.
# If the registry value is set to 1, the script exits with code 0.

$registryPath = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
$propertyName = 'RestartNotificationsAllowed2'

$value = (Get-ItemProperty -Path $registryPath -ErrorAction SilentlyContinue).$propertyName

if ($value -ne 1) {
    Write-Output "Windows Update restart notifications are not allowed. Current value: $value"
    exit 1
}
else {
    Write-Output "Windows Update restart notifications are allowed. Current value: $value"
    exit 0
}
