#!/bin/bash
# Simple YouTube Downloader with custom folder selection

# Check if URL is given
if [ -z "$1" ]; then
    echo "❌ Usage: open <YouTube-URL>"
    exit 1
fi

URL=$1

# Ask user for download folder
echo -n "📂 Enter download folder path (default: ~/Downloads/YT): "
read FOLDER

# If empty, use default
if [ -z "$FOLDER" ]; then
    FOLDER=~/Downloads/YT
fi

# Create folder if not exists
mkdir -p "$FOLDER"

# Download video using yt-dlp
echo "⬇️ Downloading into: $FOLDER"
yt-dlp -o "$FOLDER/%(title)s.%(ext)s" "$URL"

echo "✅ Download complete! Saved in: $FOLDER"
