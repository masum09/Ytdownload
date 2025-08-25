#!/data/data/com.termux/files/usr/bin/bash
set -e

OUTDIR="$HOME/Downloads/YT"
mkdir -p "$OUTDIR"

echo "📦 Installing dependencies..."
pkg update -y && pkg upgrade -y
pkg install -y python ffmpeg -y
pip install -U yt-dlp

# Create "open" command
echo "⚙️ Creating 'open' command..."
cat > $PREFIX/bin/open <<'EOL'
#!/data/data/com.termux/files/usr/bin/bash
set -e

OUTDIR="$HOME/Downloads/YT"
mkdir -p "$OUTDIR"

URL="$1"
if [ -z "$URL" ]; then
  read -p "Paste YouTube URL: " URL
fi

if [ -z "$URL" ]; then
  echo "🤡 No URL provided!"
  exit 1
fi

yt-dlp -o "$OUTDIR/%(title).200B [%(id)s].%(ext)s" \
      -f "bv*+ba/b" \
      --merge-output-format mp4 \
      --no-mtime \
      "$URL"

echo "✅ Downloaded to $OUTDIR"
EOL

chmod +x $PREFIX/bin/open

echo "👻 Done! Now use: open <YouTube_URL>"
