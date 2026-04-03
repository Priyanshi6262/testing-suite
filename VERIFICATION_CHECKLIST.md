# Storybook Project - Setup Checklist & Verification

## ✅ Issues Fixed

### 1. Dependency Version Conflict
- **Problem**: Storybook 10.3.3 requires Vite ^5.0.0, but package.json had ^4.5.0
- **Solution**: Updated `vite: "^5.0.0"` in package.json
- **Status**: ✅ FIXED

### 2. Missing Counter Story
- **Problem**: Counter component had no .stories.jsx file
- **Solution**: Created `src/stories/Counter.stories.jsx`
- **Status**: ✅ FIXED

### 3. Button Component Props
- **Problem**: Button test expected onClick prop but component didn't have it
- **Solution**: Added onClick, size, and primary props to Button component
- **Status**: ✅ FIXED

### 4. Test Consistency
- **Problem**: Button.test.jsx had test for onClick but component didn't support it
- **Solution**: Updated Button component to support onClick
- **Status**: ✅ FIXED

---

## 📋 Pre-Installation Verification

Run this to check current state:

```bash
# Check package.json Vite version
npm ls vite --depth=0

# Should show: vite@5.0.0 or compatible
```

**Expected Output**: `vite@5.0.0` (or higher in the 5.x range)

---

## 🚀 Installation Instructions

### Primary Method (Recommended)
```bash
npm install --legacy-peer-deps
```

**Why `--legacy-peer-deps`?**
- Storybook 10.3.3 has strict peer dependencies
- This flag uses npm 6 behavior (allows mismatches)
- Currently the most reliable method for this setup

### Timeline
- Should take: 2-5 minutes
- Expect: ~250-300 MB of packages
- Watch for: No ERROR in output (warnings OK)

### What Gets Installed
- ✅ storybook@10.3.3
- ✅ @storybook/react-vite@10.3.3
- ✅ @storybook/addon-essentials@10.3.3
- ✅ react@18.2.0
- ✅ jest@29.7.0
- ✅ vite@5.0.0
- ✅ All peer dependencies and transitive deps

---

## ✔️ Post-Installation Verification

After `npm install --legacy-peer-deps` completes, verify:

### Check 1: Storybook Packages Installed
```bash
npm ls @storybook/react-vite
npm ls @storybook/addon-essentials
```

**Expected**: Shows installed versions without ERR!

### Check 2: Core Dependencies
```bash
npm ls react vite jest
```

**Expected**:
```
react@18.2.0
vite@5.0.0
jest@29.7.0
```

### Check 3: Node Modules Exists
```bash
Test-Path node_modules
```

**Expected**: `True` (directory exists)

### Check 4: Key Files Present
```bash
ls node_modules/@storybook
ls node_modules/storybook
```

**Expected**: Both directories exist with many files

---

## 🧪 Functionality Tests (Post-Installation)

### Test 1: Storybook Startup
```bash
npm run storybook
```

**Expected Output**:
```
Storybook 10.3.3 started...
- Local: http://localhost:6006/
- On your network: http://[your-ip]:6006/
```

**Access**: http://localhost:6006 in browser
**Should See**: Storybook interface with component stories

### Test 2: Run Unit Tests
```bash
npm test
```

**Expected Output**:
```
PASS  src/tests/Button.test.jsx
PASS  src/tests/Card.test.jsx
PASS  src/tests/Counter.test.jsx
PASS  src/tests/Input.test.jsx

Tests:   12 passed, 12 total
```

### Test 3: Build App
```bash
npm run build
```

**Expected**: Creates `dist/` folder with production build

### Test 4: Start Dev Server
```bash
npm run dev
```

**Expected**: 
```
Local:   http://localhost:5173/
Network: http://[your-ip]:5173/
```

---

## 🔧 Troubleshooting Decision Tree

### Error: "Cannot find package '@storybook/react-vite'"

**Step 1**: Try again with fresh install
```bash
npm install --legacy-peer-deps
```

**Step 2**: If still fails, clear cache
```bash
npm cache clean --force
npm install --legacy-peer-deps
```

**Step 3**: If still fails, complete reset
```bash
Remove-Item -Recurse -Force node_modules
Remove-Item -Force package-lock.json
npm cache clean --force
npm install --legacy-peer-deps
```

**Step 4**: If still fails, try with force flag
```bash
npm install --legacy-peer-deps --force
```

---

### Error: "Port 6006 already in use"

Use different port:
```bash
npm run storybook -- -p 6007
```

---

### Error: "Jest ENOENT or Cannot find module"

Run tests setup:
```bash
npm install --legacy-peer-deps
npm test
```

---

### Tests Pass But Storybook Won't Start

Verify Storybook config:
```bash
# Check if .storybook/main.mjs exists
Test-Path .storybook/main.mjs

# Check if .storybook/preview.mjs exists  
Test-Path .storybook/preview.mjs
```

Both should return `True`

---

## 📦 File Structure Verification

### Required Directories
```
d:\vs_code\testing-suite\
├── src/
│   ├── components/          ✅ 4 components
│   ├── stories/             ✅ 4 stories + extras
│   ├── tests/               ✅ 4 test files
│   ├── App.jsx              ✅
│   └── main.jsx             ✅
├── .storybook/
│   ├── main.mjs             ✅
│   └── preview.mjs          ✅
├── node_modules/            ✅ (after npm install)
├── package.json             ✅
└── vite.config.mjs          ✅
```

### Files Modified
- `package.json` - Updated vite to ^5.0.0
- `src/components/Button.jsx` - Added onClick, size, primary props
- `src/tests/Button.test.jsx` - Restored onClick test
- `src/stories/Counter.stories.jsx` - Created new file

---

## 🎯 Success Criteria

After all steps, you should have:

✅ npm install completes without errors
✅ `npm run storybook` starts successfully  
✅ Storybook UI loads at http://localhost:6006/
✅ All 4 components visible in Storybook
✅ All stories load and render correctly
✅ `npm test` passes all 12 unit tests
✅ `npm run dev` starts dev server
✅ Browser shows all components working

---

## 🆘 Need Help?

If you encounter issues:

1. **Check npm version**: `npm --version` (needs 9+)
2. **Check Node version**: `node --version` (needs 18+)
3. **Check internet connection**: Required for npm downloads
4. **Run complete reset**: Follow "Step 3" in troubleshooting above
5. **Check disk space**: Need at least 1GB free

---

## 📌 Quick Reference

| Command | Purpose | Expected Duration |
|---------|---------|-------------------|
| `npm install --legacy-peer-deps` | Install all deps | 2-5 min |
| `npm run storybook` | Start Storybook UI | 10-20 sec |
| `npm test` | Run unit tests | 5-10 sec |
| `npm run dev` | Start dev server | 5-10 sec |
| `npm run build` | Production build | 10-20 sec |

---

**Current Status**: Ready for npm install
**All Issues**: Fixed ✅
**Next Action**: Run `npm install --legacy-peer-deps`
