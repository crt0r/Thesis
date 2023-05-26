Param (
    [Parameter(Mandatory = $true)]
    [String]
    $FileName
)

If (! $(Test-Path $FileName)) {
    Wrtite-Error File not found!
    exit 1
}

$FileContentLines = @(Get-Content $FileName)
$TotalCounter = 0

foreach ($Item in $FileContentLines) {
    try {
        $ParsedInt = $([Int] $Item)
        $TotalCounter += $ParsedInt
    } catch {
        continue
    }
}

Write-Host "[$(Split-Path -Leaf $FileName)] TOTAL: $TotalCounter"