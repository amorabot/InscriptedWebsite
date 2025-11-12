# Inscripted Website - Deployment Guide

## Quick Deploy Options

### Option 1: GitHub Pages (Recommended)

**Setup:**
1. Push your code to GitHub (if not already done)
2. Go to repository Settings → Pages
3. Under "Source", select branch: `main` (or your default branch)
4. Click Save
5. Your site will be live at: `https://amorabot.github.io/InscriptedWebsite/`

**Custom Domain (Optional):**
1. Add a `CNAME` file with your domain name
2. Configure DNS settings with your domain provider
3. Update in GitHub Pages settings

### Option 2: Netlify

**Method 1 - Drag & Drop:**
1. Go to [netlify.com](https://netlify.com)
2. Drag the project folder onto the Netlify dashboard
3. Done! You'll get a URL like `inscripted-xxxx.netlify.app`

**Method 2 - Git Integration:**
1. Connect your GitHub repository
2. Build settings:
   - Build command: (leave empty)
   - Publish directory: `/` (root)
3. Deploy automatically on every push

**Custom Domain:**
- Add in Netlify dashboard → Domain settings

### Option 3: Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Run: `vercel`
3. Follow prompts
4. Or connect via [vercel.com](https://vercel.com) dashboard

### Option 4: Traditional Web Host

Upload these files via FTP/cPanel:
```
index.html
css/
js/
assets/
```

Most shared hosting providers support this (Bluehost, HostGator, etc.)

## Pre-Deployment Checklist

- [ ] Test website locally in multiple browsers
- [ ] Verify all images load correctly
- [ ] Test responsive design (mobile, tablet, desktop)
- [ ] Check all links (Discord, GitHub, email)
- [ ] Validate HTML: [validator.w3.org](https://validator.w3.org/)
- [ ] Test accessibility: [wave.webaim.org](https://wave.webaim.org/)
- [ ] Optimize images (already optimized, but verify file sizes)
- [ ] Test page load speed: [pagespeed.web.dev](https://pagespeed.web.dev/)

## Performance Optimization (Optional)

### Image Optimization
```bash
# If images are too large, use:
# Install imagemagick first
convert inscriptedlogo.png -quality 85 inscriptedlogo.png
```

### Enable Caching (Netlify example)
Create `netlify.toml`:
```toml
[[headers]]
  for = "/*"
  [headers.values]
    Cache-Control = "public, max-age=31536000"
```

### Enable Compression
Most hosts do this automatically, but verify gzip/brotli is enabled.

## Environment-Specific Notes

### GitHub Pages
- Uses HTTPS automatically
- Custom domain requires DNS configuration
- Build time: ~1 minute
- Free for public repositories

### Netlify
- Automatic HTTPS with Let's Encrypt
- Instant cache invalidation
- Continuous deployment from Git
- Free tier is generous

### Vercel
- Edge network for fast global delivery
- Automatic HTTPS
- Preview deployments for PRs
- Free for personal projects

## Troubleshooting

### Images not loading
- Check file paths are relative: `./assets/images/`
- Verify case sensitivity (Linux servers are case-sensitive)
- Ensure images are committed to git

### Fonts not loading
- Google Fonts should work automatically
- Check browser console for CORS errors
- Verify internet connection for CDN fonts

### Mobile menu not working
- Clear browser cache
- Check JavaScript console for errors
- Verify `script.js` is loading

## DNS Configuration (Custom Domain)

**For apex domain (example.com):**
```
A Record: @ → [Host IP]
```

**For subdomain (www.example.com):**
```
CNAME: www → [Host URL]
```

**Netlify/Vercel specific:**
- Follow their DNS documentation
- They provide specific nameservers or DNS records

## Analytics (Optional)

### Google Analytics
Add before `</head>`:
```html
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

### Plausible Analytics (Privacy-friendly)
```html
<script defer data-domain="yourdomain.com" src="https://plausible.io/js/script.js"></script>
```

## SEO Post-Deployment

1. Submit sitemap to Google Search Console
2. Share on social media (Discord, Reddit, Twitter)
3. Link from main Inscripted repository
4. Add to Minecraft server lists (if applicable)

## Monitoring

- **Uptime**: [uptimerobot.com](https://uptimerobot.com) (free monitoring)
- **Performance**: [pagespeed.web.dev](https://pagespeed.web.dev)
- **Broken links**: Check quarterly

## Support

For deployment issues:
- GitHub Issues: [Create an issue](https://github.com/amorabot/InscriptedWebsite/issues)
- Discord: https://discord.gg/SWnWghYRHr
- Email: daniel.amorim@alu.ufc.br

---

**Estimated deployment time:** 5-10 minutes
**Technical difficulty:** Beginner-friendly
