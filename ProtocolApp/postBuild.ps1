# Define parameters here:

# $args[0] = VisualStudio's $(OutDir)
# Sane default?
$OutDir = if ($args[0]) {$args[0]} else {"..\build\output\"}

function makeDir {
    Param( [String]$newDir )
    if (-NOT (Test-Path "${OutDir}\${newDir}")) {
        New-Item -ItemType "directory" -path "$OutDir" -name $newDir }
}

Write-Output " |> MkDir Configuration and Data..."
makeDir("configuration")
makeDir("data")

Write-Output " |> Copying DLLs..."
xcopy /Y ".\configuration\*.*" "${OutDir}configuration\"
xcopy /Y ".\lib\Teknic\lib_x64\*.dll" "${OutDir}"
xcopy /Y ".\lib\Teknic\lib_x64\*.xml" "${OutDir}"
xcopy /Y ".\lib\Microchip3DTouchpad\lib_x64\mchp_hmi.dll" "${OutDir}"
