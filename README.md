# OpenPacks — Quick Start & Tier Summary

## What is OpenPacks?

A freemium packaging system for small and medium businesses, independent shops, locations, service businesses, freelancers, and multi-site operators. Start completely free by self-hosting mature open-source projects from GitHub. Move to managed, customized, or supported versions at SMB prices — not enterprise retainers.

**Core Principle:** Free base systems + Starter Packs ($499–$2,500 one-time) + Managed ($49–$249/mo) + Custom (from $1,500). All prices intentionally lower than enterprise custom AI/ERP builds ($7k–$60k+).

---

## Deploy & View

- **GitHub Repo**: https://github.com/praveenkay/OpenpacksAI
- **Live App**: https://praveenkay.github.io/OpenpacksAI/
- **Product Blueprint (PDF)**: [blueprint.pdf](blueprint.pdf)
- **README**: [README.md](README.md)

The site is deployed via GitHub Pages on the default `gh-pages` branch. No custom domain required yet — point it to `https://praveenkay.github.io/OpenpacksAI/` once enabled in repo settings.

### How to Deploy

1. Clone: `git clone https://github.com/praveenkay/OpenpacksAI.git`
2. Run: `docker compose up -d` (base system + AI agent layer on your own hardware).
3. Deploy 1–2 high-value agents from templates.
4. Upgrade to managed or paid packs when value is proven.

---

## Free Foundation (Self-Hosted)

Start by cloning the starter repository and running `docker compose up`. Unlimited use, no per-user fees on the software itself.

### Free Base Systems (Pick by Vertical)

| Vertical | Base System | License | Core Features |
|----------|-------------|---------|---------------|
| **Property / Rentals** | OpenProperty | MIT | Units, leases, rent ledger, maintenance work orders |
| **Field Service / Trades** | OpenFieldPro | Check repo | Customers, jobs, scheduling, work orders, estimates, invoicing |
| **Salons / Appointment** | OpenSalon / Pronto | Check repo | Booking, staff calendar, clients, services, basic inventory |
| **Retail / Shops / Vendors** | Posnic / MyCompany | AGPL-3.0 / Apache 2.0 | Offline-first POS, product catalog, barcode, checkout, basic inventory |
| **Restaurants** | URY on ERPNext / Posnic | GPL-3.0 / AGPL-3.0 | Tables, menu, dine-in/takeaway, kitchen display basics, offline POS |
| **General SMB** | Dolibarr / ERPNext / MyCompany | GPL-3.0 / Apache 2.0 | Quotes, invoices, CRM, inventory, projects, basic accounting |

### AI Agent Layer (Self-Hosted, Zero API Cost)

| Tool | License | Purpose |
|------|---------|---------|
| n8n Community Edition | MIT/GPL-3.0 | Visual workflows with AI agent nodes, 400+ integrations |
| Dify / Langflow | MIT | Visual agent, RAG, workflow builders |
| CrewAI / LangGraph | MIT | Multi-agent and stateful orchestration |
| Hermes Agent, OpenClaw | — | Always-on/desktop agents working with local models via Ollama/LM Studio (zero API cost) or BYOK |

---

## Industry Packs (Free Base → Paid Enhancements)

### 1. Property / Rental Agencies (OpenProperty or ERPNext)
- **Free Base**: Properties, units, tenants, leases, rent ledger, maintenance work orders
- **Starter Pack ($599–$1,299)**: Guided setup + sample data for local market, late-rent reminder templates, basic owner reports & bank matching config
- **Paid (high priority)**: Automated reminders + late-fee rules, tenant portal for requests + photos, work-order tracking with audit trail, owner statements / accounting export, multi-location roles & custom local rules

### 2. HVAC / Mechanical / Trades Field Service (OpenFieldPro or ERPNext Field)
- **Free Base**: Customers, jobs, scheduling, work orders, estimates, invoicing
- **Starter Pack ($1,199–$2,499)**: Dispatch board + mobile-friendly tech workflows, price book for common HVAC/plumbing/electrical tasks, sample job types & checklists
- **Paid (high priority)**: Same-day / on-site invoicing, photo + signature capture, "On My Way" customer texts, GPS / live status & route helpers, skill-based assignment & parts inventory

### 3. Landscaping / Lawn Care (OpenFieldPro configured for recurring)
- **Free Base**: Jobs, crew scheduling, estimates, invoicing (same field-service base)
- **Starter Pack ($899–$1,799)**: Recurring route templates, crew calendars & basic job costing, sample service catalog (mowing, cleanup, seasonal)
- **Paid**: Route sequencing helpers, auto-invoicing on job completion, photo proof of work, weather-aware notes & client updates

### 4. Handyman / Small Multi-Trade (Lightweight OpenFieldPro or Dolibarr/MyCompany)
- **Free Base**: Fast mobile quotes, calendar, work orders, on-site invoicing
- **Starter Pack ($499–$999)**: Price book & common job templates, deposit / simple payment config, solo-operator friendly setup
- **Paid**: Client portal & status updates, recurring client jobs, advanced reporting & multi-crew if needed

### 5. Small Vendors — Food Trucks, Markets, Pop-ups (Posnic or MyCompany)
- **Free Base**: Offline-first catalog, checkout, basic inventory
- **Starter Pack ($499–$999)**: Event / multi-location sample setup, low-stock & unit-conversion config, receipt branding
- **Paid**: Offline sync improvements, multi-event reporting, payment integration & alerts

### 6. Retail / Shops (Posnic or MyCompany)
- **Free Base**: Product catalog, barcode, checkout, basic inventory, daily reports
- **Starter Pack ($799–$1,499)**: Docker / one-command setup, sample product data + category structure, low-stock alert config
- **Managed / Add-ons**: Real-time multi-channel sync, payment terminal integration, advanced reports / export to accounting

### 7. Restaurants (URY on ERPNext or Posnic)
- **Free Base**: Tables, menu, dine-in / takeaway, kitchen display basics, offline POS
- **Starter Pack ($999–$1,999)**: Pre-configured restaurant chart + sample menu, KDS setup with basic station routing, staff roles
- **Paid Enhancements**: Live table board, better KDS routing + offline, simple recipe depletion, fast split/merge checkout

### 8. General SMB (Dolibarr / ERPNext / MyCompany)
- **Free Base**: Full ERP: quotes, invoices, CRM, inventory, projects, basic accounting
- **Starter Pack ($699–$1,999)**: Chart of accounts localized, module activation + sample data, user roles
- **Paid**: Payment reminders, e-invoicing / tax compliance, custom reports & dashboards, hosting + priority support

---

## Pain Points Research (What We Fix First)

| Vertical | Highest-Impact Problems | Quantified Impact |
|----------|------------------------|-------------------|
| Property | Rent reconciliation 12–15 hrs/week; maintenance by text no tracking; late owner statements | Late fees missed; 77% delay non-urgent work |
| HVAC/Trades | Manual scheduling wastes $3k–$5k/mo; paper tickets delay invoicing; techs without parts | 15–20% billable hours lost; ~74% first-time fix rate |
| Landscaping | Route chaos wastes drive time; recurring contracts inconsistently billed | Hundreds per crew/month wasted |
| Handyman | Admin exceeds job time; missed materials markup; no same-day invoicing | Cash flow drag on small jobs |
| Small Vendors | Offline-first required; perishable waste; fast checkout needed | Stockouts/waste from poor tracking |
| Retail | 56% discover stockouts at checkout; disconnected POS/inventory | 10–25% customers permanently lost |
| Restaurants | Table status blindness; paper ticket chaos; inventory guesswork | Slow turnover kills covers |
| General SMB | Spreadsheet invoicing, untracked payments, limited reporting | Cash flow & reporting gaps |

---

## Simple Pricing

| Tier | Price | What's Included |
|------|-------|-----------------|
| **Free / Community** | $0 forever | Self-host any base system • Full source code (GitHub) • Unlimited users & data • Community docs & templates |
| **Starter Pack** | $499–$2,500 one-time | Pre-configured Docker setup • Industry sample data & workflows • Branding + basic integrations • Guided install + 30-day support |
| **Managed** | $49–$249 /month | Hosted & updated for you • Backups, monitoring, SSL • Priority support • Multi-location ready |
| **Custom** | From $1,500 project | Custom modules & reports • Payment / accounting / WhatsApp integrations • Mobile or advanced workflows • Training, migration & localizations |

All prices intentionally lower than enterprise custom AI/ERP builds ($7k–$60k+).

---

## Packaging Blueprints (per vertical)

### 1. Property / Rental Agencies (OpenProperty or ERPNext)
- **Free Base**: Properties, units, tenants, leases, rent ledger, maintenance work orders
- **Starter Pack ($599–$1,299)**: Guided setup + sample data for local market, late-rent reminder templates, basic owner reports & bank matching config
- **Paid (high priority)**: Automated reminders + late-fee rules, tenant portal for requests + photos, work-order tracking with audit trail, owner statements / accounting export, multi-location roles & custom local rules

### 2. HVAC / Mechanical / Trades Field Service (OpenFieldPro or ERPNext Field)
- **Free Base**: Customers, jobs, scheduling, work orders, estimates, invoicing
- **Starter Pack ($1,199–$2,499)**: Dispatch board + mobile-friendly tech workflows, price book for common HVAC/plumbing/electrical tasks, sample job types & checklists
- **Paid (high priority)**: Same-day / on-site invoicing, photo + signature capture, "On My Way" customer texts, GPS / live status & route helpers, skill-based assignment & parts inventory

### 3. Landscaping / Lawn Care (OpenFieldPro configured for recurring)
- **Free Base**: Jobs, crew scheduling, estimates, invoicing (same field-service base)
- **Starter Pack ($899–$1,799)**: Recurring route templates, crew calendars & basic job costing, sample service catalog (mowing, cleanup, seasonal)
- **Paid**: Route sequencing helpers, auto-invoicing on job completion, photo proof of work, weather-aware notes & client updates

### 4. Handyman / Small Multi-Trade (Lightweight OpenFieldPro or Dolibarr/MyCompany)
- **Free Base**: Fast mobile quotes, calendar, work orders, on-site invoicing
- **Starter Pack ($499–$999)**: Price book & common job templates, deposit / simple payment config, solo-operator friendly setup
- **Paid**: Client portal & status updates, recurring client jobs, advanced reporting & multi-crew if needed

### 5. Small Vendors — Food Trucks, Markets, Pop-ups (Posnic or MyCompany)
- **Free Base**: Offline-first catalog, checkout, basic inventory
- **Starter Pack ($499–$999)**: Event / multi-location sample setup, low-stock & unit-conversion config, receipt branding
- **Paid**: Offline sync improvements, multi-event reporting, payment integration & alerts

### 6. Retail / Shops (Posnic or MyCompany)
- **Free Base**: Product catalog, barcode, checkout, basic inventory, daily reports
- **Starter Pack ($799–$1,499)**: Docker / one-command setup, sample product data + category structure, low-stock alert config
- **Managed / Add-ons**: Real-time multi-channel sync, payment terminal integration, advanced reports / export to accounting

### 7. Restaurants (URY on ERPNext or Posnic)
- **Free Base**: Tables, menu, dine-in / takeaway, kitchen display basics, offline POS
- **Starter Pack ($999–$1,999)**: Pre-configured restaurant chart + sample menu, KDS setup with basic station routing, staff roles
- **Paid Enhancements**: Live table board, better KDS routing + offline, simple recipe depletion, fast split/merge checkout

### 8. General SMB (Dolibarr / ERPNext / MyCompany)
- **Free Base**: Full ERP: quotes, invoices, CRM, inventory, projects, basic accounting
- **Starter Pack ($699–$1,999)**: Chart of accounts localized, module activation + sample data, user roles
- **Paid**: Payment reminders, e-invoicing / tax compliance, custom reports & dashboards, hosting + priority support

---

## Base Systems Comparison

| System | Best For | License | Self-Host Ease | Maturity |
|--------|----------|---------|----------------|----------|
| MyCompany | Full ERP + POS | Apache 2.0 | High | High |
| Dolibarr | Micro / Small | GPL-3.0 | Very High | High |
| ERPNext | Growing SMB / Field / Property | GPL-3.0 | Medium | Very High |
| OpenProperty | Landlords / Rentals | MIT | High | Medium |
| Posnic | Retail / Restaurant / Vendors | AGPL-3.0 | High | Medium-High |
| OpenFieldPro | Field Service (HVAC, Landscaping, Handyman) | Check repo | Medium | Emerging |
| Ory | Salons / Barbershops / Spas / Appointment Businesses | Check repo | High | Medium |

OpenPacks — Package mature open-source systems. Free to start. Fair pricing to grow. Customizable for any area.

Built from real GitHub projects: MyCompany, Dolibarr, ERPNext, Posnic, OpenProperty, OpenFieldPro, URY and more.

---

## How to Engage

Primary call-to-action: **Get Started — Free Self-Host Now** (see landing page). Clone a starter repo, run `docker compose up`, deploy agents for common tasks (invoice follow-ups, appointment reminders, review monitoring, inventory alerts, voice-to-report field notes, lead qualification). Upgrade to managed or paid packs when value is proven.
