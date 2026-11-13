#!/usr/bin/env bash
# OpenPacks Free Tier — One-Command Installer
# Works on: macOS, Linux, Windows (WSL/Git Bash)
# Usage: curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/free.sh | bash
set -euo pipefail

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log()  { echo -e "${GREEN}[FREE]${NC} $*"; }
warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
err()  { echo -e "${RED}[ERROR]${NC} $*"; }

echo ""
echo "╔══════════════════════════════════════════════════════╗"
echo "║        OpenPacks — Free Tier Installer              ║"
echo "║        $0 forever. No credit card.                   ║"
echo "╚══════════════════════════════════════════════════════╝"
echo ""

# 1. Check prerequisites
log "Checking prerequisites..."
if ! command -v docker &>/dev/null; then
    err "Docker is not installed. Install it from https://docker.com/products/docker/desktop/"
    exit 1
fi
if ! command -v docker-compose &>/dev/null && ! docker compose version &>/dev/null; then
    err "Docker Compose is not available. Update Docker Desktop or install separately."
    exit 1
fi
log "✓ Docker found"

# 2. Check if running on supported OS
OS="$(uname -s)"
case "$OS" in
    Darwin) log "✓ macOS detected" ;;
    Linux)  log "✓ Linux detected" ;;
    *)      warn "Unsupported OS: $OS. May have issues." ;;
esac

# 3. Create project directory
PROJECT_DIR="${1:-$HOME/openpacks-free}"
log "Setting up OpenPacks in: $PROJECT_DIR"
mkdir -p "$PROJECT_DIR"
cd "$PROJECT_DIR"

# 4. Download free tier files
log "Downloading free tier configuration..."
if [ ! -f docker-compose.yml ]; then
    curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/packages/free/docker-compose.yml -o docker-compose.yml
fi
if [ ! -f .env ]; then
    cat > .env <<EOF
# OpenPacks Free Tier — Auto-generated $(date)
OPENPACKS_TIER=free
OPENPACKS_PORT=8080
OPENPACKS_DOMAIN=localhost
EOF
fi

# 5. Pull and start services
log "Starting OpenPacks Free Tier..."
if docker compose version &>/dev/null; then
    docker compose up -d --build
else
    docker-compose up -d --build
fi

# 6. Verify
log "Verifying installation..."
sleep 5
if curl -sf http://localhost:8080/health &>/dev/null; then
    log "✓ OpenPacks Free Tier is running!"
    echo ""
    echo "╔══════════════════════════════════════════════════════╗"
    echo "║  🎉 SUCCESS!                                         ║"
    echo "║                                                      ║"
    echo "║  Open your browser and visit:                        ║"
    echo "║  → http://localhost:8080                             ║"
    echo "║  → https://praveenkay.github.io/OpenpacksAI/         ║"
    echo "║                                                      ║"
    echo "║  This is the FREE tier. Unlimited use.               ║"
    echo "║  Upgrade when ready: starter packs from $49.         ║"
    echo "╚══════════════════════════════════════════════════════╝"
else
    warn "Services may still be starting. Check with:"
    warn "  cd $PROJECT_DIR && docker compose logs -f"
    warn ""
    warn "Or visit: http://localhost:8080"
fi