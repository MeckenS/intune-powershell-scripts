# This script checks for the presence of BeyondTrust MSI uninstallation keys in the registry.

$beyondTrustKey = Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* | 
    Where-Object { $_.DisplayName -like "*BeyondTrust*" }

if ($null -ne $beyondTrustKey) {
    Write-Host "Found BeyondTrust installation: $($beyondTrustKey.DisplayName)"
    exit 0
} else {
    Write-Host "No BeyondTrust installation found."
    exit 1
}

