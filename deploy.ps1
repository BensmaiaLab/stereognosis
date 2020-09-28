#requires -version 6
<#
.SYNOPSIS
    Deploys the Stereognosis application.
.DESCRIPTION
    Deploys the contents of the local build dir to a target remote system using
    the WSMan system in Powershell.
.PARAMETER BuildDir
    Local Directory that will be compressed and copied to remote system.
.PARAMETER TargetHost
    Target IP or Hostname used to locate remote host.
.INPUTS
    Files in the Build dir
.OUTPUTS
    Modifies TargetDir on TargetHost.
.NOTES
    Version:        1.0
    Author:         Danielle MacDonald
    Creation Date:  2020-09

    You MUST setup the TargetHost as a TrustedHost in your local configuration
    for this script to work. In pwsh as Admin, to get your list of TrustedHosts:
    `Get-Item -Path WSMan:\localhost\Client\TrustedHosts`

    To add to trusted hosts (appends to list):
    `Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value '<IP or Hostname>' -Concatenate -Force`

.EXAMPLE
    deploy.ps1 -TargetHost '172.16.254.1'
#>

# Defaults TargetHost to the current Stereognosis Control Host IP
param (
    [Parameter(Mandatory=$true)][String[]]$BuildDir,
    [String[]]$TargetHost='205.208.63.128'
)

$PackageFile = 'deploy.zip'
$TargetDir = 'C:\Somlab\bin\stereognosis\'

function Deploy-ToTargetHost {
        
    # Compress, then push to remote
    # https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-7
    $p = @{
        Path = ".\build\output\"
        CompressionLevel = "Fastest"
        DestinationPath = ".\$PackageFile"
    }
    Compress-Archive @p
    # TODO: Don't forget to clean up generated files

    $sess = New-PSSession -ComputerName $TargetHost

    # Oneliner for testing dir existence:
    # Invoke-Command -Session $sess -ArgumentList $TargetDir {param($a);Test-Path $a}
    
    # Create dir on remote sys if it doesn't already exist:
    Invoke-Command -Session $sess -ArgumentList ($TargetDir) {
        param($arg1)
        if (-NOT (Test-Path $arg1)) {
            New-Item -ItemType Directory -Path $arg1 }
    }

    Copy-Item -Path ".\$PackageFile" -Destination "$TargetDir" -ToSession $sess

    $sess | Remove-PSSession
}


Deploy-ToTargetHost