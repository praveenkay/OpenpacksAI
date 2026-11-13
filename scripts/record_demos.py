#!/usr/bin/env python3
"""Record a screen-capture style demo video of the app using Chrome + ffmpeg."""
import asyncio, subprocess, os, sys, json, time
from playwright.sync_api import sync_playwright

APP = "http://localhost:8901/app.html"
OUT = os.path.join(os.path.dirname(os.path.abspath(__file__)), "demos")
os.makedirs(OUT, exist_ok=True)

def record_tour(video_name, duration_sec=8, fps=24):
    """Record a full-page scroll tour of the app using Playwright + ffmpeg."""
    frames_dir = os.path.join(OUT, f"_{video_name}_frames")
    os.makedirs(frames_dir, exist_ok=True)
    frame_count = int(duration_sec * fps)
    step = max(1, int(2400 / frame_count))

    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        page = browser.new_page(viewport={"width": 1280, "height": 800})
        page.goto(APP, wait_until="networkidle")
        time.sleep(0.5)

        # Screenshot each frame while scrolling
        for i in range(frame_count):
            scroll_y = int((2400 / frame_count) * i)
            page.evaluate(f"window.scrollTo(0, {scroll_y})")
            page.wait_for_timeout(60)
            page.screenshot(path=os.path.join(frames_dir, f"{i:05d}.png"))
            time.sleep(0.04)

        browser.close()

    # Build video with ffmpeg
    video_path = os.path.join(OUT, video_name)
    ffmpeg_cmd = [
        "ffmpeg", "-y", "-framerate", str(fps),
        "-i", os.path.join(frames_dir, "%05d.png"),
        "-c:v", "libx264", "-pix_fmt", "yuv420p",
        "-vf", "scale=1280:800:force_original_aspect_ratio=decrease,pad=1280:800:(ow-iw)/2:(oh-ih)/2",
        "-t", str(duration_sec), video_path
    ]
    r = subprocess.run(ffmpeg_cmd, capture_output=True, text=True, timeout=120)
    if r.returncode != 0:
        print(f"[ERROR] {video_name}: {r.stderr[:200]}")
    else:
        print(f"[OK] {video_name}")

    # Cleanup frames
    for f in os.listdir(frames_dir):
        os.remove(os.path.join(frames_dir, f))
    os.rmdir(frames_dir)

# Generate demo videos
record_tour("demo-tour.mp4", duration_sec=8)
record_tour("demo-packs.mp4", duration_sec=6)
record_tour("demo-calculator.mp4", duration_sec=6)

print("done")