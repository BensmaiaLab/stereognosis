#requires -version 6
<#
.SYNOPSIS
    Deploys the Stereognosis application.
.DESCRIPTION
    Deploys the contents of the local build dir to a target remote system using
    the WSMan system in Powershell.
.PARAMETER TargetHost
    <Brief description of parameter input required. Repeat this attribute if required>
.INPUTS
    Files in the Build dir
.OUTPUTS
    Outputs to TargetDir on the TargetHost.
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
  <Example goes here. Repeat this attribute for more than one example>
#>

# Defaults TargetHost to the current Stereognosis Control Host IP
param (
    [String[]]$TargetHost='205.208.63.128'
)

$PackageFile = 'deploy.zip'
$RemoteIP = '205.208.63.128'

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

    $sess = New-PSSession -ComputerName $RemoteIP

    Copy-Item -Path ".\$PackageFile" -Destination 'C:\' -ToSession $sess

    $sess | Remove-PSSession
}


Deploy-ToTargetHost