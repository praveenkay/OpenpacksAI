# OpenPacks — Installation Guide

One-command installers for every tier. Works on macOS, Linux, Windows (WSL/Git Bash), and any device with Docker.

---

## Free Tier — $0 Forever

```bash
curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/free.sh | bash
```

Or manually:
```bash
git clone https://github.com/praveenkay/OpenpacksAI
cd OpenpacksAI/packages/free
cp .env.example .env
docker compose up -d
```

Then visit: `http://localhost:8080`

---

## Starter Pack — $49–$2,500 One-Time

```bash
curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/starter.sh | bash
```

The installer prompts you to select your industry vertical, then downloads the pre-configured pack with sample data, branding, and integrations.

---

## Managed — $9–$49/Month

```bash
curl -fsSL https://raw.githubusercontent.com/praveenkay/OpenpacksAI/main/scripts/install/managed.sh | bash
```

---

## Pricing Summary

| Tier | Price | What You Get |
|------|-------|-------------|
| **Free** | $0 forever | Self-host any base system, full source code, unlimited users & data, community docs & templates |
| **Starter Pack** | $49–$2,500 one-time | Pre-configured Docker setup, industry sample data & workflows, branding + basic integrations, guided install + 30-day support |
| **Managed** | $9–$49/month | Hosted & updated for you, backups, monitoring, SSL, priority support, multi-location ready |
| **Custom** | From $1,500 project | Custom modules & reports, payment/accounting/WhatsApp integrations, mobile or advanced workflows, training, migration & localizations |

---

## Package Directory Structure

```
packages/
├── free/
│   ├── docker-compose.yml    # Free tier stack
│   └── README.md
├── starter/
│   ├── docker-compose.yml    # Generic starter stack
│   ├── README.md
│   └── {property,hvac,landscaping,handyman,vendors,retail,restaurants,smb}/
│       └── docker-compose.yml    # Per-vertical starter config
└── managed/
    ├── docker-compose.yml    # Managed hosting stack
    └── README.md
```

---

## Cross-Platform Support

- **Web**: All packages run in Docker containers, accessible via browser at `http://localhost:8080`
- **macOS**: Docker Desktop or `brew install --cask docker`
- **Linux**: `apt install docker.io docker-compose` or use Docker's official install script
- **Windows**: Docker Desktop for Windows, or WSL2 with Docker
- **Mobile**: PWA-ready — add to home screen from the web app