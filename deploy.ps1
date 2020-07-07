
# Compress, then push to remote
# https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-7
$p = @{
    Path = ".\build\output\"
    CompressionLevel = "Fastest"
    DestinationPath = ".\deploy.zip"
}
Compress-Archive @p
# TODO: Don't forget to clean up generated files

# https://blog.ipswitch.com/use-powershell-copy-item-cmdlet-transfer-files-winrm

# IP 205.208.63.128 - Hostname 

$sess = New-PSSession -ComputerName '205.208.63.128'

Copy-Item –Path C:\Folder1\file1.txt –Destination 'C:\' –ToSession $sess
$sess | Remove-PSSession
