# OpenOps AI Product Blueprint

## Document Version: 1.0
## Last Updated: November 2026
## Author: OpenOps AI Concept

---

## Executive Summary

OpenOps AI is a freemium AI operating system designed for small and medium businesses, independent shops, locations, service businesses, freelancers, and multi-site operators. It applies the same operational philosophy used by custom AI firms such as Afrex AI (Company OS, agents that monitor/read/decide/act, quantified bottlenecks, industry-tuned systems) but starts completely free using open-source tools from GitHub and related sources, then moves to low-cost subscriptions, add-ons, and fixed-price custom solutions.

**Core Problem:** Most SMBs and independents cannot afford $7,500–$15,000+ custom builds or $17k–$60k/month retainers.

**Core Solution:** OpenOps AI gives them a lightweight "Company OS" layer with four components:
- **Company Brain** — Knowledge of processes and context
- **Live Business Signals** — Alerts from CRM, email, forms, payments
- **Execution Engine** — AI agents that follow up, generate reports, book, recover revenue
- **Organizational Memory and simple governance**

Everything begins free and self-hosted. Paid layers add convenience, managed hosting, premium industry packs, and custom work at prices suited to smaller operators.

---

## Free Foundation (GitHub & Open-Source Stack)

The free tier is built on actively maintained tools (late 2026 status):

| Tool | License | Description |
|------|---------|-------------|
| **n8n Community Edition** | MIT/GPL-3.0 | Visual workflows with AI agent nodes, unlimited executions, 400+ integrations. Software free; only VPS cost (~$6–24/month). |
| **Dify Community** | MIT | Visual agent, RAG, and workflow builder. |
| **Langflow** | MIT | Visual workflow builder with drag-and-drop. |
| **CrewAI** | MIT | Multi-agent orchestration for goal-driven tasks. |
| **LangGraph** | MIT | Stateful multi-agent orchestration. |
| **Hermes Agent** | — | Always-on or desktop agents that work with local models via Ollama/LM Studio (zero API cost) or bring-your-own-key. |
| **OpenClaw** | — | Reverse engineering and analysis tools. |
| **goose** | — | CLI tool for interacting with LLMs and local models. |
| **OpenHands** | — | AI agent that performs software development tasks. |
| **AnythingLLM** | — | Desktop application for running LLMs with document context. |
| **Cal.com** | MIT | Open-source Calendario alternative for scheduling. |
| **Open CRMs** | Various | Lightweight customer relationship management tools. |

### Free Base Systems by Vertical (OpenPacks)
| Vertical | Base System | License | Core Features |
|----------|-------------|---------|---------------|
| **Property / Rentals** | OpenProperty | MIT | Units, leases, rent ledger, maintenance work orders |
| **Field Service / Trades** | OpenFieldPro | Check repo | Customers, jobs, scheduling, work orders, estimates, invoicing |
| **Salons / Appointment** | OpenSalon / Pronto | Check repo | Booking, staff calendar, clients, services, basic inventory |
| **Retail / Shops / Vendors** | Posnic / MyCompany | AGPL-3.0 / Apache 2.0 | Offline-first POS, product catalog, barcode, checkout, basic inventory |
| **Restaurants** | URY on ERPNext / Posnic | GPL-3.0 / AGPL-3.0 | Tables, menu, dine-in/takeaway, kitchen display basics, offline POS |
| **General SMB** | Dolibarr / ERPNext / MyCompany | GPL-3.0 / Apache 2.0 | Quotes, invoices, CRM, inventory, projects, basic accounting |

### User Onboarding
Users clone a starter repository, run `docker compose up`, and deploy agents for common tasks:
- Invoice follow-ups
- Appointment reminders
- Review monitoring
- Inventory alerts
- Voice-to-report field notes
- Lead qualification

---

## Pricing Model (Cheaper Than Enterprise Custom AI)

| Tier | Price | What You Get |
|------|-------|--------------|
| **Free / Community** | $0 + your VPS/local | Full self-hosted stack, unlimited workflows, starter templates, local models or BYOK |
| **Starter Hosted** | $29–49 / month | Managed 1–2 agents (e.g. billing + booking/reviews), basic industry pack, no server management |
| **Growth** | $99–149 / month | 3–5 agents, advanced signals/memory, premium packs (shops, field, property, multi-location) |
| **Pro / Multi-Location** | $249–399 / month | Full Company OS layer, custom tuning, audit trails |
| **Add-ons** | $9–49 / month or one-time | Extra agents, voice modules, compliance packs, lead gen |
| **Custom Solutions** | $1,500–5,000 one-time or $499–1,500/mo retainer | Bespoke builds (portals, quoting tools, specialized agents). Fixed quotes, well below typical enterprise pricing |

**Model/API usage** is separate in free tier (or local) and included with fair-use limits in higher tiers. This undercuts pure n8n Cloud or Dify Professional while adding the business-specific agent and industry focus those tools lack.

### OpenPacks Pricing (One-Time + Managed)
| Tier | Price | What's Included |
|------|-------|-----------------|
| **Free / Community** | $0 | Self-host the open-source base. Unlimited. |
| **Starter Pack** | $499–$2,500 one-time | Pre-configured industry pack + guided setup + 30 days support |
| **Managed** | $49–$249 / month | Hosting, updates, backups, SSL, priority support, multi-location ready |
| **Custom** | From $1,500 project | New modules, integrations, migration, training, localizations |

---

## Industry Packs (Priority Verticals)

### 1. Property / Rental Agencies (OpenProperty)
- **Free Base**: Properties, units, tenants, leases, rent ledger, maintenance work orders
- **Starter Pack ($599–$1,299)**: Guided setup + sample data, late-rent reminder templates, basic owner reports & bank matching config
- **Paid Enhancements**: Automated reminders + late-fee rules, tenant portal with photos, work-order audit trail, owner statements/accounting export, multi-location roles & custom local rules

### 2. HVAC / Mechanical / Trades Field Service (OpenFieldPro)
- **Free Base**: Customers, jobs, scheduling, work orders, estimates, invoicing
- **Starter Pack ($1,199–$2,499)**: Dispatch board + mobile-friendly tech workflows, price book for common HVAC/plumbing/electrical tasks, sample job types & checklists
- **Paid Enhancements**: Same-day / on-site invoicing, photo + signature capture, "On My Way" customer texts, GPS / live status & route helpers, skill-based assignment & parts inventory

### 3. Landscaping / Lawn Care (OpenFieldPro configured for recurring)
- **Free Base**: Jobs, crew scheduling, estimates, invoicing (same field-service base)
- **Starter Pack ($899–$1,799)**: Recurring route templates, crew calendars & basic job costing, sample service catalog (mowing, cleanup, seasonal)
- **Paid**: Route sequencing helpers, auto-invoicing on job completion, photo proof of work, weather-aware notes & client updates

### 4. Handyman / Small Multi-Trade (Lightweight OpenFieldPro or Dolibarr/MyCompany)
- **Free Base**: Fast mobile quotes, calendar, work orders, on-site invoicing
- **Starter Pack ($499–$999)**: Price book & common job templates, deposit / simple payment config, solo-operator friendly setup
- **Paid Enhancements**: Client portal & status updates, recurring client jobs, advanced reporting & multi-crew if needed

### 5. Small Vendors — Food Trucks, Markets, Pop-ups (Posnic or MyCompany)
- **Free Base**: Offline-first catalog, checkout, basic inventory
- **Starter Pack ($499–$999)**: Event / multi-location sample setup, low-stock & unit-conversion config, receipt branding
- **Paid Enhancements**: Offline sync improvements, multi-event reporting, payment integration & alerts

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
- **Paid Enhancements**: Payment reminders, e-invoicing / tax compliance, custom reports & dashboards, hosting + priority support

---

## Base Systems Comparison

| System | Best For | License | Self-Host Ease | Maturity |
|--------|----------|---------|----------------|----------|
| **MyCompany** | Full ERP + POS | Apache 2.0 | High | High |
| **Dolibarr** | Micro / Small | GPL-3.0 | Very High | High |
| **ERPNext** | Growing SMB / Field / Property | GPL-3.0 | Medium | Very High |
| **OpenProperty** | Landlords / Rentals | MIT | High | Medium |
| **Posnic** | Retail / Restaurant / Vendors | AGPL-3.0 | High | Medium-High |
| **OpenFieldPro** | Field Service (HVAC, Landscaping, Handyman) | Check repo | Medium | Emerging |

OpenPacks — Package mature open-source systems. Free to start. Fair pricing to grow. Customizable for any area.

Built from real GitHub projects: MyCompany, Dolibarr, ERPNext, Posnic, OpenProperty, OpenFieldPro, URY and more.

---

## How to Engage
Primary call-to-action: **"Map My Moving Parts"** (Calendly strategy/discovery calls, free or low-friction initial conversations). Contact: info@afrexai.com

You can also explore YouTube/X (@christy_afrex) and Substack ("AI Agent Insights") for founder commentary and client results.