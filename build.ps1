# Builds all solutions on Dani's machine, tested with Jenkins.
# 2020-06-19 DMacDonald

param ([switch] $debug=$False, [switch] $clean=$False)
if ($debug) {
    $ReleaseConfig = 'Debug'
} else {
    $ReleaseConfig = 'Release'
}
Write-Output "Release config is '$ReleaseConfig'"

if ($clean) {
    $BuildPath = ".\build"
    if (Test-Path $BuildPath) {
        Write-Output "Removing '.\build for a fresh build!"
        Remove-Item -LiteralPath $BuildPath -Force -Recurse
    }
}

# Launch-VsDevShell.ps1 changes workingdir, so remember it first:
$WorkingDir = (Get-Location).path

# Detect VS Dev Shell location (Must have pwsh vssetup module installed)
# Install-Module VSSetup -Scope CurrentUser -AcceptLicense -Force

$VSInstallPath = (Get-VSSetupInstance).InstallationPath
# Returns: C:\Program Files (x86)\Microsoft Visual Studio\2019\Community
$DevShell = $VSInstallPath + "\Common7\Tools\Launch-VsDevShell.ps1"

# The devshell loads in MSBuild env vars, path could be VERY different on your PC
& $DevShell
Write-Output "$(Get-Date -Format o) - build.ps1: Starting MSBuild!"
Set-Location $WorkingDir
msbuild.exe /p:Configuration=$ReleaseConfig /p:Platform="x64" ".\ProtocolApp.sln"
