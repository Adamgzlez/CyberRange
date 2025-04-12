<#
.SYNOPSIS
    This PowerShell script ensures that the built-in guest account is renamed.

.NOTES
    Author          : Adam Gonzalez
    LinkedIn        : linkedin.com/in/adamgzlez
    GitHub          : github.com/Adamgzlez
    Date Created    : 2025-04-10
    Last Modified   : 2025-04-12
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000025

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\WN10-SO-000025-Remediation.ps1 
#>

# Renaming the Guest Account

try {
    # Get the built-in Guest account (SID ending with -501)
    $guestAccount = Get-LocalUser | Where-Object { $_.SID -like "*-501" }

    if ($null -ne $guestAccount) {
        # Rename the Guest account to "RenamedLocaluser"
        Rename-LocalUser -Name $guestAccount.Name -NewName "RenamedLocaluser"
        Write-Output "Guest account renamed to 'RenamedLocaluser' successfully."
    } else {
        Write-Output "Guest account not found."
    }
} catch {
    Write-Error "Failed to rename Guest account: $_"
}
