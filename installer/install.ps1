# OpenPacks — Master Installation Wizard (Windows / PowerShell)
# Usage: iwr -useb https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/installer/install.ps1 | iex
$ErrorActionPreference = "Stop"

function Log($msg)  { Write-Host "[INSTALL] $msg" -ForegroundColor Green }
function Info($msg) { Write-Host "[INFO]    $msg" -ForegroundColor Cyan }
function Warn($msg) { Write-Host "[WARN]    $msg" -ForegroundColor Yellow }
function Err($msg)  { Write-Host "[ERROR]   $msg" -ForegroundColor Red }

Write-Host ""
Write-Host "======================================================"
Write-Host "        OpenPacks - Installation Wizard"
Write-Host "======================================================"
Write-Host ""

# 1. Check Docker
Log "Checking prerequisites..."
$docker = Get-Command docker -ErrorAction SilentlyContinue
if (-not $docker) {
    Err "Docker is not installed."
    Write-Host "  Install Docker Desktop for Windows: https://docker.com/products/docker-desktop/"
    exit 1
}
Log "Docker found"
docker version --format '{{.Server.Version}}' 2>$null | Out-Null

# 2. Select pack
$packs = [ordered]@{
    "1" = @{ id="property";      name="Property / Rentals" }
    "2" = @{ id="hvac";          name="HVAC / Trades" }
    "3" = @{ id="landscaping";   name="Landscaping / Lawn" }
    "4" = @{ id="handyman";      name="Handyman / Multi-Trade" }
    "5" = @{ id="vendors";       name="Small Vendors" }
    "6" = @{ id="retail";        name="Retail / Shops" }
    "7" = @{ id="restaurants";   name="Restaurants" }
    "8" = @{ id="smb";           name="General SMB" }
}
Write-Host ""
Write-Host "Select your industry pack:"
$packs.GetEnumerator() | ForEach-Object { Write-Host "  $($_.Key)) $($_.Value.name)" }
Write-Host ""
$choice = Read-Host "Enter choice (1-8)"
if (-not $packs.Contains($choice)) { Err "Invalid choice"; exit 1 }
$pack = $packs[$choice].id
Log "Selected: $pack"

# 3. Select tier
Write-Host ""
Write-Host "  1) Free - Self-host ($0 forever)"
Write-Host "  2) Starter Pack - One-time setup"
Write-Host "  3) Managed - Hosted for you"
Write-Host ""
$tierChoice = Read-Host "Enter choice (1-3)"
$tier = @{ "1"="free"; "2"="starter"; "3"="managed" }[$tierChoice]
if (-not $tier) { Err "Invalid choice"; exit 1 }
Log "Tier: $tier"

# 4. Company info
Write-Host ""
$company = Read-Host "Company name (optional)"
$domain  = Read-Host "Domain / URL (optional)"
if (-not $domain) { $domain = "localhost" }

# 5. Install
$projectDir = Join-Path $HOME "openpacks-$pack"
Log "Setting up in: $projectDir"
New-Item -ItemType Directory -Force -Path $projectDir | Out-Null
Set-Location $projectDir

$raw = "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/$pack/docker-compose.yml"
Log "Downloading $pack pack configuration..."
Invoke-WebRequest -Uri $raw -OutFile "docker-compose.yml"

$envFile = @"
TIER=$tier
PACK=$pack
COMPANY=$company
DOMAIN=$domain
APP_PORT=3000
APP_URL=http://localhost:3000
DB_NAME=$pack
DB_USER=openpacks
DB_PASS=openpacks
"@
Set-Content -Path ".env" -Value $envFile

Log "Starting $pack pack ($tier)..."
if (docker compose version 2>$null) {
    docker compose up -d --build
} else {
    docker-compose up -d --build
}

Start-Sleep -Seconds 5
try {
    $r = Invoke-WebRequest -Uri "http://localhost:3000" -TimeoutSec 5 -ErrorAction Stop
    Log "$pack pack is running!"
    Write-Host ""
    Write-Host "======================================================"
    Write-Host "  Installation Complete! Open: http://localhost:3000"
    Write-Host "  Pack: $pack   Tier: $tier"
    Write-Host "  First login: admin / admin123"
    Write-Host "======================================================"
} catch {
    Warn "Services may still be starting."
    Warn "Check: cd $projectDir; docker compose logs -f"
    Warn "Visit: http://localhost:3000"
}
