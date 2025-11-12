# Website Testing Guide

## Quick Start - View Locally

### Option 1: Direct File Open
Simply double-click `index.html` or right-click → Open With → Your Browser

### Option 2: Local Server (Recommended)
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000

# Node.js (if you have 'serve' installed)
npx serve

# Then open: http://localhost:8000
```

## Testing Checklist

### Visual Testing
- [ ] Logo displays correctly in hero section
- [ ] Developer avatar shows in About section
- [ ] All colors match theme (dark gray bg, orange accents)
- [ ] Fonts load properly (Cinzel for headings)
- [ ] Cards have hover effects
- [ ] Smooth animations on scroll

### Navigation Testing
- [ ] Click "Home" - scrolls to hero
- [ ] Click "Items" - scrolls to item section
- [ ] Click "Archetypes" - scrolls to archetypes
- [ ] Click "Developer" - scrolls to developer section
- [ ] Navbar becomes solid on scroll
- [ ] Active nav link highlights current section

### Responsive Testing
**Desktop (1920px):**
- [ ] All cards display in grid
- [ ] Hero logo centered and large
- [ ] Three archetype cards side-by-side

**Tablet (768px):**
- [ ] Hamburger menu appears
- [ ] Cards stack appropriately
- [ ] Text remains readable

**Mobile (375px):**
- [ ] Mobile menu opens/closes
- [ ] All cards stack vertically
- [ ] Touch-friendly buttons
- [ ] Logo scales down

### Interactive Features
- [ ] Discord button opens https://discord.gg/SWnWghYRHr
- [ ] GitHub link opens @amorabot profile
- [ ] Email link opens mail client
- [ ] Smooth scroll works on all nav links
- [ ] Parallax effect in hero (desktop)
- [ ] Card tilt effect on hover (desktop)

### Accessibility Testing
- [ ] Tab through navigation (keyboard only)
- [ ] Focus indicators visible
- [ ] All images have alt text
- [ ] Color contrast sufficient
- [ ] Works without JavaScript (graceful degradation)

### Browser Testing
Test in at least 2 browsers:
- [ ] Chrome/Edge
- [ ] Firefox
- [ ] Safari (if on Mac)
- [ ] Mobile browser

### Performance Testing
1. Open DevTools (F12)
2. Go to Network tab
3. Reload page
4. Check:
   - [ ] Total load time < 2 seconds
   - [ ] All images load
   - [ ] No 404 errors
   - [ ] CSS and JS load successfully

### Content Verification
- [ ] All archetype names correct (Marauder, Gladiator, Templar)
- [ ] Element colors match:
  - Strength = Red/Orange (Fire)
  - Dexterity = Yellow (Lightning)
  - Intelligence = Cyan (Cold)
- [ ] Developer bio accurate
- [ ] Discord link correct
- [ ] GitHub link correct
- [ ] Email address correct

## Common Issues & Fixes

### Images not showing
**Problem**: Broken image icons
**Fix**:
- Check `assets/images/` folder has both PNG files
- Verify file names: `inscriptedlogo.png` and `pfp4.png`
- Check browser console for errors

### Fonts look wrong
**Problem**: Default system fonts instead of gothic fonts
**Fix**:
- Check internet connection (Google Fonts CDN)
- Clear browser cache
- Wait 30 seconds for fonts to download

### Mobile menu not working
**Problem**: Hamburger doesn't open menu
**Fix**:
- Check browser console for JavaScript errors
- Ensure `js/script.js` is loaded
- Try hard refresh (Ctrl+Shift+R or Cmd+Shift+R)

### Smooth scroll not working
**Problem**: Page jumps instead of smooth scroll
**Fix**:
- Some browsers have "reduce motion" enabled
- Check browser settings
- This is actually good for accessibility!

## Validation Tools

### HTML Validation
1. Go to https://validator.w3.org/
2. Upload `index.html` or paste URL
3. Fix any errors/warnings

### CSS Validation
1. Go to https://jigsaw.w3.org/css-validator/
2. Upload `css/styles.css`
3. Warnings are OK (vendor prefixes, CSS variables)

### Accessibility Check
1. Go to https://wave.webaim.org/
2. Enter your URL (after deploying)
3. Aim for 0 errors

### Performance Check
1. Deploy website first
2. Go to https://pagespeed.web.dev/
3. Enter your URL
4. Aim for 90+ score

## Browser DevTools Tips

### Check Responsive Design
1. Press F12 (or Cmd+Option+I on Mac)
2. Click device icon (or Cmd+Shift+M)
3. Test different screen sizes

### Debug JavaScript
1. Open Console tab
2. Look for errors (red text)
3. Check Network tab for failed loads

### Inspect Elements
1. Right-click any element
2. Select "Inspect"
3. Modify CSS in real-time to test changes

## Ready to Deploy?

If all tests pass, proceed with deployment:
- See `DEPLOYMENT.md` for deployment instructions
- GitHub Pages is the quickest option
- Netlify is great for automatic deployments

## Need Help?

- Check browser console for errors
- Search error messages on Stack Overflow
- Ask in Discord: https://discord.gg/SWnWghYRHr
- Create GitHub issue: https://github.com/amorabot/InscriptedWebsite/issues
