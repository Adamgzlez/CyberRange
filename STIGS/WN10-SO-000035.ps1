<#
.SYNOPSIS
    This PowerShell script ensures that the outgoing secure channel traffic must be encrypted or signed.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
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
