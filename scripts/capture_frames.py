#!/usr/bin/env python3
"""Render OpenPacks app pages to PNG frames for demo video generation."""
import subprocess, sys, os, json, time

CHROME = "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
BASE = "http://localhost:8901/app.html"
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "frames")
os.makedirs(OUT, exist_ok=True)

def shot(name, url, width=1280, height=800, js=None):
    """Screenshot a URL, optionally after executing JS."""
    args = [
        CHROME, "--headless=new", "--disable-gpu", "--no-sandbox",
        "--hide-scrollbars", "--force-device-scale-factor=1",
        f"--window-size={width},{height}",
        f"--screenshot={os.path.join(OUT, name)}",
        "--virtual-time-budget=4000",
    ]
    if js:
        args.append(f"--run-all-compositor-stages-before-draw")
        # Use data: URL trick to inject JS — simpler: use a small wrapper page
    args.append(url)
    r = subprocess.run(args, capture_output=True, text=True, timeout=60)
    if r.returncode != 0:
        print(f"[warn] {name}: {r.stderr[:200]}")
    return os.path.join(OUT, name)

# 1. Hero shot
shot("01-hero.png", BASE)

# 2. Scrolled to packs — use a fragment URL
shot("02-packs.png", BASE + "#packs")

# 3. Pain points
shot("03-pain.png", BASE + "#pain")

# 4. Pricing
shot("04-pricing.png", BASE + "#pricing")

# 5. Calculator
shot("05-calc.png", BASE + "#calculator")

# 6. Compare table
shot("06-compare.png", BASE + "#compare")

# 7. Full-page tall shot
shot("07-fullpage.png", BASE, width=1280, height=2400)

print("frames done")
for f in sorted(os.listdir(OUT)):
    p = os.path.join(OUT, f)
    print(f, os.path.getsize(p))