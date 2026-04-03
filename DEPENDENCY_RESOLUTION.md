# Storybook Dependency Resolution Guide

## Problem Analysis

**Error**: `Cannot find package '@storybook/react-vite'`

This occurs because:
1. Storybook 10.3.3 requires Vite 5.x (peer dependency: vite@"^5.0.0 || ^6.0.0 || ^7.0.0 || ^8.0.0")
2. Original package.json had Vite 4.5.0
3. npm install failed due to this peer dependency conflict

## Fixed Configuration

✅ **Updated Vite version** from `^4.5.0` to `^5.0.0` in package.json

Current dependency versions are now compatible:
- vite: ^5.0.0
- storybook: ^10.3.3
- @storybook/react-vite: ^10.3.3
- @storybook/addon-essentials: ^10.3.3

## Installation Commands (in order)

### Option 1: Standard Installation (Recommended)
```bash
npm install --legacy-peer-deps
```

### Option 2: If Option 1 Fails - Complete Clean Install
```bash
# Windows PowerShell
Remove-Item -Recurse -Force node_modules
Remove-Item -Force package-lock.json
npm cache clean --force
npm install --legacy-peer-deps
```

### Option 3: If Option 2 Fails - Force Latest Compatible Versions
```bash
npm install --legacy-peer-deps --force
```

## What Each Flag Does

- `--legacy-peer-deps`: Allows npm to ignore peer dependency mismatches (old npm behavior)
- `--force`: Forces npm to fetch remote resources even if local packages exist
- `npm cache clean --force`: Completely clears npm's local cache

## Verification Steps

After installation:

```bash
# Verify Vite is installed correctly
npm ls vite

# Verify Storybook packages
npm ls storybook
npm ls @storybook/react-vite
npm ls @storybook/addon-essentials

# Check if node_modules has all packages
ls node_modules | grep -i storybook
```

## Starting Storybook

Once dependencies are installed:

```bash
npm run storybook
```

Expected output:
```
Storybook 10.3.3 started
- Local:            http://localhost:6006/
```

Then access http://localhost:6006 in your browser.

## Project Structure Verified
- ✅ Button component + Button.stories.jsx
- ✅ Card component + Card.stories.jsx  
- ✅ Counter component + Counter.stories.jsx (created)
- ✅ Input component + Input.stories.jsx
- ✅ All tests: Button.test.jsx, Card.test.jsx, Counter.test.jsx, Input.test.jsx
- ✅ Storybook config: .storybook/main.mjs, .storybook/preview.mjs
- ✅ Build config: vite.config.mjs, jest.config.cjs, babel.config.cjs

## Storybook Configuration Details

**File**: `.storybook/main.mjs`
```javascript
- framework: @storybook/react-vite
- addons: @storybook/addon-essentials
- stories: ../src/**/*.mdx, ../src/**/*.stories.@(js|jsx|mjs|ts|tsx)
- viteConfigPath: ../vite.config.mjs
```

**File**: `.storybook/preview.mjs`
- Includes light/dark mode backgrounds
- Proper color configuration for theme switching

## All Issues Resolved ✅

| Issue | Solution | Status |
|-------|----------|--------|
| Vite version conflict | Updated to 5.0.0 | ✅ Fixed |
| Missing Counter story | Created Counter.stories.jsx | ✅ Fixed |
| Button missing onClick prop | Added to Button component | ✅ Fixed |
| Missing dependencies | Install with --legacy-peer-deps | ⏳ Pending |

## Next Steps After Installation

1. Verify all tests pass: `npm test`
2. Start development: `npm run dev`
3. View stories: `npm run storybook`
4. Build for production: `npm run build`
