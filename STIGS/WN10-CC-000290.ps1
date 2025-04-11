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
    STIG-ID         : WN10-CC-000290

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000290-Remediation.ps1 
#>

# Define the registry path
$RegPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services"

# Check if the path exists, if not, create it
if (-not (Test-Path $RegPath)) {
    New-Item -Path $RegPath -Force
}

# Set the registry value
New-ItemProperty -Path $RegPath -Name "MinEncryptionLevel" -PropertyType DWord -Value 3 -Force

Write-Output "Registry key MinEncryptionLevel set to 3 successfully."
