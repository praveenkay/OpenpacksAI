# OpenPacks — Installation Guide

One-command installers for every tier. Works on macOS, Linux, Windows (WSL/Git Bash), and any device with Docker.

---

## Master Installation Wizard

```bash
curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/installer/install.sh | bash
```

The wizard prompts you to:
1. Select your industry pack (Property, HVAC, Landscaping, Handyman, Small Vendors, Retail, Restaurants, General SMB)
2. Select your tier (Free, Starter, Managed)
3. Enter your company name and domain
4. Downloads the pack, configures it, and starts it

---

## Per-Pack Installers

Each pack has its own one-command installer:

| Pack | Install Command |
|------|----------------|
| Property | `curl -fsSL .../packages/property/install.sh \| bash` |
| HVAC | `curl -fsSL .../packages/hvac/install.sh \| bash` |
| Landscaping | `curl -fsSL .../packages/landscaping/install.sh \| bash` |
| Handyman | `curl -fsSL .../packages/handyman/install.sh \| bash` |
| Small Vendors | `curl -fsSL .../packages/vendors/install.sh \| bash` |
| Retail | `curl -fsSL .../packages/retail/install.sh \| bash` |
| Restaurants | `curl -fsSL .../packages/restaurants/install.sh \| bash` |
| General SMB | `curl -fsSL .../packages/smb/install.sh \| bash` |

---

## Pricing Summary

| Tier | Price | What You Get |
|------|-------|-------------|
| **Free** | $0 forever | Self-host any base system, full source code, unlimited users & data |
| **Starter Pack** | $299–$1,199 one-time | Pre-configured Docker setup, industry sample data, branding, 30-day support |
| **Managed** | $9–$49/month | Hosted & updated for you, backups, monitoring, SSL, priority support |
| **Custom** | From $999 project | Custom modules, integrations, training, migration |

---

## Package Directory Structure

```
packages/
├── property/         — Property / Rentals (OpenProperty)
├── hvac/             — HVAC / Trades (OpenFieldPro)
├── landscaping/      — Lawn Care (OpenFieldPro recurring)
├── handyman/         — Multi-Trade (OpenFieldPro / Dolibarr)
├── vendors/          — Small Vendors (Posnic / MyCompany offline)
├── retail/           — Retail / Shops (Posnic / MyCompany)
├── restaurants/      — Restaurants (URY / Posnic)
├── smb/              — General SMB (Dolibarr / ERPNext / MyCompany)
├── free/             — Free tier base
├── starter/          — Starter tier base
└── managed/          — Managed tier base
```

---

## Cross-Platform Support

- **Web**: All packages run in Docker containers, accessible via browser
- **macOS**: Docker Desktop or `brew install --cask docker`
- **Linux**: `apt install docker.io docker-compose`
- **Windows**: Docker Desktop for Windows, or WSL2 with Docker
- **Mobile**: PWA-ready — add to home screen from the web app
