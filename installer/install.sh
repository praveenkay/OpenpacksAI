#!/usr/bin/env bash
# OpenPacks — Master Installation Wizard
# Works on: macOS, Linux, Windows (WSL/Git Bash)
# Usage: curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/installer/install.sh | bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[INSTALL]${NC} $*"; }
info() { echo -e "${BLUE}[INFO]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()  { echo -e "${RED}[ERROR]${NC} $*"; }

echo ""
echo "╔══════════════════════════════════════════════════════════╗"
echo "║          OpenPacks — Installation Wizard                 ║"
echo "║          Free Open-Source Business OS                    ║"
echo "╚══════════════════════════════════════════════════════════╝"
echo ""

# 1. Check Docker
log "Checking prerequisites..."
if ! command -v docker &>/dev/null; then
    err "Docker is not installed."
    echo "  Install it from:"
    echo "    macOS:   https://docker.com/products/docker-desktop/"
    echo "    Linux:   https://docs.docker.com/engine/install/"
    echo "    Windows: https://docker.com/products/docker-desktop/"
    exit 1
fi
log "✓ Docker found ($(docker --version | cut -d' ' -f3 | cut -d',' -f1))"

# 2. Select industry pack
echo ""
echo "Select your industry pack:"
echo ""
echo "  1) Property / Rentals    — OpenProperty (MIT)"
echo "  2) HVAC / Trades         — OpenFieldPro (ERPNext Field)"
echo "  3) Landscaping / Lawn    — OpenFieldPro (recurring)"
echo "  4) Handyman / Multi-Trade — OpenFieldPro / Dolibarr"
echo "  5) Small Vendors         — Posnic / MyCompany (offline)"
echo "  6) Retail / Shops        — Posnic / MyCompany"
echo "  7) Restaurants           — URY (ERPNext) / Posnic"
echo "  8) General SMB           — Dolibarr / ERPNext / MyCompany"
echo ""
read -rp "Enter choice (1-8): " CHOICE

case $CHOICE in
    1) PACK="property"      ;;
    2) PACK="hvac"          ;;
    3) PACK="landscaping"   ;;
    4) PACK="handyman"      ;;
    5) PACK="vendors"       ;;
    6) PACK="retail"        ;;
    7) PACK="restaurants"   ;;
    8) PACK="smb"           ;;
    *) err "Invalid choice"; exit 1 ;;
esac

log "Selected: $PACK pack"

# 3. Select tier
echo ""
echo "Select your tier:"
echo ""
echo "  1) Free — Self-host ($0 forever)"
echo "  2) Starter Pack — One-time setup"
echo "  3) Managed — Hosted for you"
echo ""
read -rp "Enter choice (1-3): " TIER_CHOICE

case $TIER_CHOICE in
    1) TIER="free"       ;;
    2) TIER="starter"    ;;
    3) TIER="managed"    ;;
    *) err "Invalid choice"; exit 1 ;;
esac

log "Tier: $TIER"

# 4. Company info
echo ""
read -rp "Company name (optional, press Enter to skip): " COMPANY
read -rp "Domain / URL (optional): " DOMAIN

# 5. Install
PROJECT_DIR="${1:-$HOME/openpacks-$PACK}"
log "Setting up in: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# Download pack configuration
log "Downloading $PACK pack configuration..."
curl -fsSL "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/$PACK/docker-compose.yml" -o docker-compose.yml

# Configure environment
cat > .env <<EOF
# OpenPacks — $PACK ($TIER)
# Generated $(date)
TIER=$TIER
PACK=$PACK
COMPANY=${COMPANY:-OpenPacks}
DOMAIN=${DOMAIN:-localhost}
APP_PORT=3000
APP_URL=http://localhost:3000
DB_NAME=$PACK
DB_USER=openpacks
DB_PASS=openpacks
EOF

# 6. Start services
log "Starting $PACK pack ($TIER tier)..."
if docker compose version &>/dev/null; then
    docker compose up -d --build
else
    docker-compose up -d --build
fi

# 7. Verify
sleep 5
if curl -sf http://localhost:3000/health &>/dev/null || curl -sf http://localhost:3000 &>/dev/null; then
    log "✓ $PACK pack is running!"
    echo ""
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║  🎉 Installation Complete!                              ║"
    echo "║                                                          ║"
    echo "║  Open your browser and visit:                            ║"
    echo "║  → http://localhost:3000                                 ║"
    echo "║                                                          ║"
    echo "║  Pack: $PACK                                             ║"
    echo "║  Tier: $TIER                                             ║"
    echo "║  Company: ${COMPANY:-OpenPacks}                           ║"
    echo "║                                                          ║"
    echo "║  First login: admin / admin123                           ║"
    echo "╚══════════════════════════════════════════════════════════╝"
else
    warn "Services may still be starting."
    warn "Check: cd $PROJECT_DIR && docker compose logs -f"
    warn "Visit: http://localhost:3000"
fi
