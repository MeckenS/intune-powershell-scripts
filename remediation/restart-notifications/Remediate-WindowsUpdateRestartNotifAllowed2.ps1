# Description: Remediation script used to configure Windows Update restart notifications.

try {
    $registryPath = 'HKLM:\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings'
    $propertyName = 'RestartNotificationsAllowed2'

    New-Item -Path $registryPath -ItemType Container -Force -ErrorAction Stop | Out-Null
    New-ItemProperty -Path $registryPath -Name $propertyName -Value 1 -PropertyType DWord -Force -ErrorAction Stop | Out-Null
}
catch {
    Write-Error "Failed to configure registry value: $($_.Exception.Message)"
}
