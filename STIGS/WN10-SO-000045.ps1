<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Josh Madakor
    LinkedIn        : linkedin.com/in/joshmadakor/
    GitHub          : github.com/joshmadakor1
    Date Created    : 2024-09-09
    Last Modified   : 2024-09-09
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
