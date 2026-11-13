#!/usr/bin/env bash
# OpenPacks Managed Installer
# Monthly hosting + support ($9–$49/mo)
# Usage: curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/managed.sh | bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[MANAGED]${NC} $*"; }
info() { echo -e "${BLUE}[INFO]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()  { echo -e "${RED}[ERROR]${NC} $*"; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║     OpenPacks — Managed Hosting Installer           ║"
echo "║     $9–$49/month — hosted, updated, backed up        ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# 1. Check prerequisites
if ! command -v docker &>/dev/null; then
    err "Docker not found. Install from https://docker.com/products/docker-desktop/"
    exit 1
fi
log "✓ Docker found"

# 2. Project directory
PROJECT_DIR="${1:-$HOME/openpacks-managed}"
log "Setting up in: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 3. Download managed configuration
log "Downloading managed configuration..."
curl -fsSL "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/managed/docker-compose.yml" -o docker-compose.yml

# 4. Environment
cat > .env <<EOF
# OpenPacks Managed Tier
# Generated $(date)
OPENPACKS_TIER=managed
OPENPACKS_PORT=8080
OPENPACKS_DOMAIN=localhost
OPENPACKS_SUPPORT_EMAIL=support@openpacks.ai
EOF

# 5. Start
log "Starting managed hosting..."
if docker compose version &>/dev/null; then
    docker compose up -d --build
else
    docker-compose up -d --build
fi

# 6. Verify
sleep 5
if curl -sf http://localhost:8080/health &>/dev/null; then
    log "✓ Managed hosting is running!"
    echo ""
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║  🎉 Managed Tier Installed!                         ║"
    echo "║                                                      ║"
    echo "║  Open: http://localhost:8080                         ║"
    echo "║  Monthly: $9–$49 (scales with users/locations)       ║"
    echo "║  Includes: backups, monitoring, SSL, priority support ║"
    echo "╚══════════════════════════════════════════════════════╝"
else
    warn "Starting. Check: cd $PROJECT_DIR && docker compose logs -f"
    warn "Visit: http://localhost:8080"
fi