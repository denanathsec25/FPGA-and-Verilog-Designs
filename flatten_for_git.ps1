$root = "E:\VLSI\Verilog"

$files = Get-ChildItem -Path $root -Recurse -File | Where-Object {
    ($_.Extension -eq ".v" -or
     $_.Extension -eq ".xdc" -or
     $_.Extension -eq ".bd" -or
     $_.Extension -eq ".coe" -or
     $_.Extension -eq ".mem" -or
     $_.Extension -eq ".xci") -and
    ($_.FullName -match "\.srcs\\(sources_1|constrs_1)\\(new|bd|imports|ip)\\")
}

foreach ($file in $files) {
    if ($file.FullName -match "^(.*)\\[^\\]+\.srcs\\(sources_1|constrs_1)\\(new|bd|imports|ip)\\(.*)$") {
        $projectFolder = $matches[1]
        $relativePath = $matches[4]
        $fileName = Split-Path $relativePath -Leaf

        $destPath = Join-Path $projectFolder $fileName

        try {
            Copy-Item -Path $file.FullName -Destination $destPath -Force -ErrorAction Stop
            Write-Host "Copied: $fileName -> $projectFolder"
        } catch {
            Write-Host "FAILED: $($file.FullName) -> $destPath"
        }
    }
}

Write-Host "`nDone. Now run git add / commit / push."