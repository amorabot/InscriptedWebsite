# WSL Setup Guide - Viewing the Website

## The Problem

When you try to open `index.html` directly by dragging it into a browser from WSL, you get:
```
The address wasn't understood
Firefox doesn't know how to open this address, because one of the following
protocols (vscode-remote) isn't associated with any program...
```

This happens because browsers can't directly access WSL file paths.

## Solution: Run a Local Web Server

### Option 1: Quick Start Script (Recommended)

```bash
./view-site.sh
```

Then open your browser (on Windows) and go to:
```
http://localhost:8000
```

### Option 2: Manual Python Server

**Python 3:**
```bash
python3 -m http.server 8000
```

**Python 2:**
```bash
python -m SimpleHTTPServer 8000
```

Then visit: `http://localhost:8000`

### Option 3: Node.js Server

If you have Node.js installed:
```bash
npx serve -p 8000
```

Then visit: `http://localhost:8000`

### Option 4: PHP Server

If you have PHP installed:
```bash
php -S localhost:8000
```

Then visit: `http://localhost:8000`

## Alternative: Copy Files to Windows

If you prefer to open files directly without a server:

### Using Windows Explorer

1. Open Windows File Explorer
2. Type in address bar: `\\wsl$\Ubuntu\var\tmp\automagik-forge\worktrees\8910-chat-i-wanna-cre`
   (Replace `Ubuntu` with your WSL distro name if different)
3. Copy the entire folder to a Windows location (e.g., `C:\Users\YourName\Desktop\InscriptedWebsite`)
4. Now you can drag `index.html` from the Windows folder into your browser

### Using WSL Command

```bash
# Copy to Windows Desktop
cp -r /var/tmp/automagik-forge/worktrees/8910-chat-i-wanna-cre /mnt/c/Users/$USER/Desktop/InscriptedWebsite

# Or copy to Documents
cp -r /var/tmp/automagik-forge/worktrees/8910-chat-i-wanna-cre /mnt/c/Users/$USER/Documents/InscriptedWebsite
```

Then open from Windows: `C:\Users\YourName\Desktop\InscriptedWebsite\index.html`

## Why Use a Local Server?

Using a local server (instead of `file://` protocol) has benefits:

1. ✅ **Proper file loading**: CSS, JS, fonts, images load correctly
2. ✅ **CORS support**: No cross-origin issues
3. ✅ **Accurate testing**: Mimics production environment
4. ✅ **Live reload**: Some servers auto-refresh on file changes

## WSL Network Access

The local server in WSL is accessible from Windows browsers automatically. WSL2 sets up networking so:
- `localhost:8000` in Windows → WSL server on port 8000
- No additional configuration needed!

## Troubleshooting

### Port 8000 already in use?

Try a different port:
```bash
python3 -m http.server 8080
# Then visit: http://localhost:8080
```

### Can't access localhost from Windows?

**WSL1 users**: Should work automatically

**WSL2 users**: If you can't access `localhost`, try:
```bash
# Get WSL IP address
ip addr show eth0 | grep inet | awk '{print $2}' | cut -d/ -f1
```

Then use that IP in your browser: `http://172.x.x.x:8000`

Or use Windows host IP:
```bash
# Access from WSL
cat /etc/resolv.conf | grep nameserver | awk '{print $2}'
```

### Server won't start?

**Check if Python is installed:**
```bash
python3 --version
# or
python --version
```

**If not installed:**
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install python3

# Or use Node.js
sudo apt install nodejs npm
```

## Best Practice Workflow

**During development:**
1. Edit files in WSL (using VS Code or vim)
2. Run `./view-site.sh` in WSL terminal
3. Open `http://localhost:8000` in Windows browser
4. Refresh browser when you make changes

**For deployment:**
- Follow `DEPLOYMENT.md` to publish to GitHub Pages/Netlify

## Quick Reference

```bash
# Start server
./view-site.sh

# Or manually
python3 -m http.server 8000

# Open in browser (Windows)
# Visit: http://localhost:8000

# Stop server
# Press Ctrl+C in terminal
```

## IDE Integration (VS Code)

If you're using VS Code with WSL extension:

1. Install "Live Server" extension
2. Right-click `index.html`
3. Select "Open with Live Server"
4. Auto-opens in browser with live reload!

---

**Summary**: Don't drag WSL files to browser. Run a server in WSL, access via `localhost` from Windows browser.
