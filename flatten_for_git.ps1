# flatten_for_git.ps1
$root = "E:\VLSI\Verilog"

$files = Get-ChildItem -Path $root -Recurse -File | Where-Object {
    ($_.Extension -eq ".v" -or $_.Extension -eq ".xdc") -and
    ($_.FullName -match "\.srcs\\(sources_1|constrs_1)\\new\\")
}

foreach ($file in $files) {
    if ($file.FullName -match "^(.*)\.srcs\\(sources_1|constrs_1)\\new\\(.*)$") {
        $projectFolder = $matches[1].TrimEnd('\')
        $fileName = $matches[3]
        $destPath = Join-Path $projectFolder $fileName
        Copy-Item -Path $file.FullName -Destination $destPath -Force
        Write-Host "Copied: $fileName -> $projectFolder"
    }
}

Write-Host "`nDone. Now run git add / commit / push."