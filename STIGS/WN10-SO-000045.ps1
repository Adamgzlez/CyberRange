<#
.SYNOPSIS
    This PowerShell script ensures that outgoing secure channel traffic must be signed when possible.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000045 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000045-Remediation.ps1 
#>

# PowerShell script to set "SignSecureChannel" to 1 in the registry

# Define the registry path
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters"

# Define the name and value
$regName = "SignSecureChannel"
$regValue = 1

# Check if the path exists
if (Test-Path $regPath) {
    # Set the registry value
    Set-ItemProperty -Path $regPath -Name $regName -Value $regValue -Type DWord
    Write-Output "Successfully set $regName to $regValue at $regPath"
} else {
    Write-Error "Registry path $regPath does not exist."
}
