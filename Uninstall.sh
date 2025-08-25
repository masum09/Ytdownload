#!/bin/bash
# Uninstall Script for YT Downloader in Termux

echo "🗑️ Removing yt-dlp..."
pip uninstall -y yt-dlp

echo "🗑️ Removing open command..."
rm -f /data/data/com.termux/files/usr/bin/open

echo "✅ Uninstall complete!"
