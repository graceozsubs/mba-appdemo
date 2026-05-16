# setup-mcp.ps1 — Downloads the GitHub MCP server binary for Windows x64
# Run once after cloning: .\scripts\setup-mcp.ps1

$Version = "v1.0.4"
$BinDir  = "$PSScriptRoot\..\bin"
$ZipUrl  = "https://github.com/github/github-mcp-server/releases/download/$Version/github-mcp-server_Windows_x86_64.zip"
$ZipPath = "$BinDir\github-mcp-server.zip"
$Exe     = "$BinDir\github-mcp-server.exe"

if (Test-Path $Exe) {
  Write-Host "github-mcp-server.exe already present — skipping download."
  exit 0
}

New-Item -ItemType Directory -Force -Path $BinDir | Out-Null
Write-Host "Downloading GitHub MCP Server $Version..."
Invoke-WebRequest -Uri $ZipUrl -OutFile $ZipPath -UseBasicParsing
Expand-Archive -Path $ZipPath -DestinationPath $BinDir -Force
Remove-Item $ZipPath
Write-Host "Done. Binary at: $Exe"
