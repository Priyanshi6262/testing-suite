# 🔴 ERROR FIX: "'sb' is not recognized"

## What Happened
```
'sb' is not recognized as an internal or external command,
operable program or batch file
```

## Why
npm install got interrupted → Binary files not created → Storybook can't start

## How To Fix (Pick ONE)

### 👉 EASIEST - Double-Click File
**File:** `setup.bat`
**Action:** Just double-click it
**Result:** Auto-fixes everything in 3-5 minutes

### 👉 ALTERNATIVE - PowerShell Script  
**File:** `START_STORYBOOK.ps1`
**Action:** Run in PowerShell
**Result:** Auto-fixes everything in 3-5 minutes

### 👉 MANUAL - Paste Commands
**Paste in terminal (one at a time):**
```bash
npm cache clean --force
npm install --legacy-peer-deps
npm run storybook
```

---

## What You'll See When It Works

```
✓ added 300+ packages
✓ Storybook started...
✓ http://localhost:6006 opens
✓ All components visible!
```

---

**DO ONE OF THE 3 OPTIONS ABOVE AND YOU'RE DONE!** ✅
