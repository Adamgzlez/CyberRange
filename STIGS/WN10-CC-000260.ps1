<#
.SYNOPSIS
    This PowerShell script ensures that the Windows 10 is configured to require a minimum pin length of six characters or greater.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2024-04-09
    Last Modified   : 2024-04-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000260 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000260-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\PassportForWork\PINComplexity"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the MinimumPINLength value to 6
New-ItemProperty -Path $registryPath -Name "MinimumPINLength" -PropertyType DWord -Value 6 -Force

Write-Output "Registry value set successfully."
