#!/bin/bash
# Installer Script for YT Downloader in Termux

echo "🚀 Installing dependencies..."
pkg update -y
pkg install -y python ffmpeg curl git

echo "📦 Installing yt-dlp..."
pip install --upgrade pip
pip install yt-dlp

echo "📂 Setting up open command..."
chmod +x open.sh
cp open.sh /data/data/com.termux/files/usr/bin/open

echo "✅ Installation complete! Now use:"
echo "   open <YouTube-URL>"
