<#
.SYNOPSIS
    This PowerShell script ensures that the TFTP Client is not installed on the system.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-08
    Last Modified   : 2025-04-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000120 

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-00-000120-Remediation.ps1 
#>

# Check if TFTP Client is installed
$tftpClient = Get-WindowsOptionalFeature -Online -FeatureName TFTP

if ($tftpClient.State -eq "Enabled") {
    Write-Output "TFTP Client is installed. Proceeding with uninstallation..."

    # Disable (uninstall) TFTP Client
    Disable-WindowsOptionalFeature -Online -FeatureName TFTP -NoRestart

    Write-Output "TFTP Client has been uninstalled successfully."
} else {
    Write-Output "TFTP Client is not installed."
}

