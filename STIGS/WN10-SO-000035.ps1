<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000035 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000035-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"

# Define the property name and value
$propertyName = "RequireSignOrSeal"
$propertyValue = 1

# Check if the registry path exists
if (Test-Path $registryPath) {
    # Set the registry value
    Set-ItemProperty -Path $registryPath -Name $propertyName -Value $propertyValue -Type DWord
    Write-Output "Registry value '$propertyName' set to '$propertyValue' successfully."
} else {
    Write-Output "Registry path not found: $registryPath"
}
