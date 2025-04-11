<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2024-04-09
    Last Modified   : 2024-04-11
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000245

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-CC-000245-Remediation.ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main"

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name "FormSuggest Passwords" -Value "no" -PropertyType String -Force

Write-Output "Registry key and value have been set successfully."
