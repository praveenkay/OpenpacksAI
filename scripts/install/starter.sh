#!/usr/bin/env bash
# OpenPacks Starter Pack Installer
# One-time setup ($49–$99 for solo, up to $2,499 for multi-location)
# Usage: curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/starter.sh | bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[STARTER]${NC} $*"; }
info() { echo -e "${BLUE}[INFO]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()  { echo -e "${RED}[ERROR]${NC} $*"; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║     OpenPacks — Starter Pack Installer              ║"
echo "║     One-time setup + 30-day support                  ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# 1. Select vertical
echo "Select your industry pack:"
echo "  1) Property / Rentals"
echo "  2) HVAC / Trades Field Service"
echo "  3) Landscaping / Lawn Care"
echo "  4) Handyman / Multi-Trade"
echo "  5) Small Vendors (Food Trucks, Markets)"
echo "  6) Retail / Shops"
echo "  7) Restaurants"
echo "  8) General SMB"
echo ""
read -rp "Enter choice (1-8): " CHOICE

case $CHOICE in
    1) VERTICAL="property"; BASE="openproperty"; PRICE="$599" ;;
    2) VERTICAL="hvac"; BASE="openfieldpro"; PRICE="$1,199" ;;
    3) VERTICAL="landscaping"; BASE="openfieldpro"; PRICE="$899" ;;
    4) VERTICAL="handyman"; BASE="openfieldpro"; PRICE="$499" ;;
    5) VERTICAL="vendors"; BASE="posnic"; PRICE="$499" ;;
    6) VERTICAL="retail"; BASE="posnic"; PRICE="$799" ;;
    7) VERTICAL="restaurants"; BASE="posnic"; PRICE="$999" ;;
    8) VERTICAL="smb"; BASE="dolibarr"; PRICE="$699" ;;
    *) err "Invalid choice"; exit 1 ;;
esac

log "Selected: $VERTICAL — Starter Pack ($PRICE one-time)"

# 2. Check prerequisites
if ! command -v docker &>/dev/null; then
    err "Docker not found. Install from https://docker.com/products/docker-desktop/"
    exit 1
fi
log "✓ Docker found"

# 3. Create project directory
PROJECT_DIR="${1:-$HOME/openpacks-$VERTICAL}"
log "Setting up in: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 4. Download starter configuration
log "Downloading $VERTICAL starter pack..."
curl -fsSL "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/starter/$VERTICAL/docker-compose.yml" -o docker-compose.yml 2>/dev/null || {
    warn "Specific pack config not found, using generic starter..."
    curl -fsSL "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/starter/docker-compose.yml" -o docker-compose.yml
}

# 5. Download industry sample data
curl -fsSL "https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/starter/$VERTICAL/sample-data.sql" -o sample-data.sql 2>/dev/null || true

# 6. Environment configuration
cat > .env <<EOF
# OpenPacks Starter Pack — $VERTICAL
# Generated $(date)
OPENPACKS_TIER=starter
OPENPACKS_VERTICAL=$VERTICAL
OPENPACKS_BASE=$BASE
OPENPACKS_PORT=8080
OPENPACKS_DOMAIN=localhost
OPENPACKS_SUPPORT_EMAIL=support@openpacks.ai
EOF

# 7. Build and start
log "Building and starting $VERTICAL Starter Pack..."
if docker compose version &>/dev/null; then
    docker compose up -d --build
else
    docker-compose up -d --build
fi

# 8. Import sample data if available
if [ -f sample-data.sql ]; then
    log "Importing industry sample data..."
    sleep 3
    # Auto-detect DB container and import
    DB_CONTAINER=$(docker compose ps -q database 2>/dev/null || docker compose ps -q postgres 2>/dev/null || echo "")
    if [ -n "$DB_CONTAINER" ]; then
        docker exec -i "$DB_CONTAINER" psql -U openpacks -d openpacks < sample-data.sql 2>/dev/null || \
        docker exec -i "$DB_CONTAINER" sqlite3 openpacks.db < sample-data.sql 2>/dev/null || true
    fi
fi

# 9. Verify
sleep 5
if curl -sf http://localhost:8080/health &>/dev/null; then
    log "✓ $VERTICAL Starter Pack is running!"
    echo ""
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║  🎉 Starter Pack Installed!                          ║"
    echo "║                                                      ║"
    echo "║  Open your browser:                                  ║"
    echo "║  → http://localhost:8080                             ║"
    echo "║                                                      ║"
    echo "║  Tier: Starter Pack ($PRICE one-time)                ║"
    echo "║  Vertical: $VERTICAL                                  ║"
    echo "║  Support: 30 days included                           ║"
    echo "║                                                      ║"
    echo "║  Next: Upgrade to Managed ($49/mo) for hosting       ║"
    echo "╚══════════════════════════════════════════════════════╝"
else
    warn "Services starting. Check: cd $PROJECT_DIR && docker compose logs -f"
    warn "Visit: http://localhost:8080"
fi