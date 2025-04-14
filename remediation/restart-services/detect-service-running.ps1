# Description: Detection script that checks if the specified service is running.
# If the service exists on the system and is not running, the script will exit with STNDOUT 1 indicating to run the remediation script.
# If the service is not found, the script will exit with STNDOUT 0 indicating no issues.

try {
    $serviceName = 'NAMEOFSERVICE' # Replace NAMEOFSERVICE with the actual service name you want to check
    $service = Get-Service -Name $($serviceName) -ErrorAction Stop

    if ($service.Status -eq 'Running') {
        Write-Host "$($service.DisplayName) is running."
        exit 0
    } else {
        Write-Host "$($service.DisplayName) is not running."
        exit 1
    }

} catch {
    Write-Host "$($service.DisplayName) not found."
    exit 0 # Service not found, exit with 0 to indicate no issues
}