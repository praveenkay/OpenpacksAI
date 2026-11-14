#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
cp -n .env.example .env 2>/dev/null || true
source .env
echo "=== OpenPacks smb Pack ==="
docker compose up -d --build
echo ""
echo "✓ smb Pack is running at: $APP_URL"
echo "  First login: admin / admin123"
