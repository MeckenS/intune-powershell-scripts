# Description: Detection script that checks if the specified service is running.
# If the service exists on the system and is not running, the script will terminate with exit code 1 indicating to run the remediation script.
# If the service is not found or the service is found and running, the script will terminate with exit code 0 indicating no issues.

$serviceName = 'NAMEOFSERVICE' # EXAMPLE: $serviceName = '*BeyondTrust Jump Client*'
$service = Get-Service -DisplayName $($serviceName)

if ($null -ne $service) {

    if ($service.Status -eq 'Running') {
        Write-Host "$($service.DisplayName) is running."
        exit 0
    } else {
        Write-Host "$($service.DisplayName) is not running."
        exit 1
    }
} else {
    Write-Host "$($serviceName) not found."
    exit 0
}