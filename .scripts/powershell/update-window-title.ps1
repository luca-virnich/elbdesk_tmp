# PowerShell -ExecutionPolicy Bypass -File .\.scripts\powershell\update-window-title.ps1 -runMode "production"

param(
    [Parameter(Mandatory=$true)]
    [string]$runMode
)

$content = Get-Content -Path "apps/elbdesk_app/windows/runner/main.cpp" -Raw
$windowTitle = switch ($runMode) {
    "production"  { "ElbDesk - Carl Ostermann Erben" }
    "staging"     { "ElbDesk - Carl Ostermann Erben (STAGING)" }
    "test"        { "ElbDesk - Carl Ostermann Erben (TEST)" }
    "development" { "ElbDesk - Carl Ostermann Erben (DEV)" }
    default       { "ElbDesk - Carl Ostermann Erben (DEV)" }
}
$content = $content -replace 'ElbDesk - Carl Ostermann Erben \(DEV\)', $windowTitle
Set-Content -Path "apps/elbdesk_app/windows/runner/main.cpp" -Value $content