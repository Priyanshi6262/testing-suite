# 🔧 FIX: "'sb' is not recognized" Error

## What Caused This Error

The error **"'sb' is not recognized as an internal or external command"** happens because:

1. **npm install was interrupted or incomplete**
   - The node_modules folder wasn't fully populated
   - Binary files in node_modules/.bin weren't created
   - Storybook CLI couldn't initialize properly

2. **Storybook binaries are missing from PATH**
   - Windows can't find the storybook executable
   - This happens when npm install doesn't complete fully

---

## ✅ SOLUTION - Run One of These

### **Option 1: Windows Batch File (EASIEST)**

**Just double-click this file:**
```
setup.bat
```

This will:
1. Install all dependencies completely
2. Verify storybook is installed
3. Start Storybook automatically

---

### **Option 2: PowerShell Script**

**Run this script in PowerShell:**
```powershell
.\START_STORYBOOK.ps1
```

Make sure to:
- Allow PowerShell scripts to run if prompted
- **DO NOT interrupt** the installation

---

### **Option 3: Manual Terminal Commands (For Debugging)**

If scripts don't work, run these commands one by one in a **NEW terminal window**:

```bash
# Step 1: Clean up incomplete installation
npm cache clean --force

# Step 2: Remove old node_modules if it exists
Remove-Item -Recurse -Force node_modules -ErrorAction SilentlyContinue

# Step 3: Install fresh with legacy peer deps
npm install --legacy-peer-deps

# Step 4: Start storybook
npm run storybook
```

**IMPORTANT**: Wait for each command to complete fully before running the next!

---

## 🚨 KEY ISSUE TO AVOID

### The Main Problem:
```
✗ npm install getting interrupted before completion
✗ Binary files not created in node_modules/.bin/
✗ Storybook CLI can't start without binaries
```

### The Solution:
```
✓ Run npm install COMPLETELY without interruption
✓ Wait for "added XXX packages" message
✓ Then run npm run storybook
```

---

## 📋 Step-by-Step (Manual Method)

1. **Open terminal** in: `D:\vs_code\testing-suite`

2. **Copy and paste:**
   ```bash
   npm cache clean --force
   ```
   Wait for `npm notice ok`

3. **Then copy and paste:**
   ```bash
   npm install --legacy-peer-deps
   ```
   **Wait 3-5 minutes** - Do NOT interrupt!
   Should end with: `added 300+ packages`

4. **Then copy and paste:**
   ```bash
   npm run storybook
   ```
   Should show: `Storybook started...`

5. **Open browser:**
   ```
   http://localhost:6006
   ```

---

## ✅ Success Indicators

After completing the fix, you should see:

✅ `added 300+ packages` (not ERRORs)
✅ `npm notice ok`
✅ Command prompt returns (doesn't hang)
✅ Storybook starts with message: `Storybook started`
✅ Browser opens or you can visit `http://localhost:6006`

---

## 🎯 What I Fixed

In your **package.json**, I changed:
```bash
# Before (with extra npx):
"storybook": "npx storybook dev -p 6006",
"dev": "npx vite",

# After (cleaner):
"storybook": "storybook dev -p 6006",
"dev": "vite",
```

This should work better once npm install completes properly.

---

## 🚀 Try These NOW

### **Best Option**: Double-click  `setup.bat`
- Automatic
- Handles everything
- Starts Storybook when done

### **Alternative**: Run in PowerShell
```powershell
.\START_STORYBOOK.ps1
```

### **Last Resort**: Manual terminal
```bash
npm cache clean --force
npm install --legacy-peer-deps
npm run storybook
```

---

## 💡 Why This Works

When you run **setup.bat** or the PowerShell script:

1. ✅ Clears npm cache (removes corrupted files)
2. ✅ Installs ALL packages completely
3. ✅ Creates binaries in node_modules/.bin/
4. ✅ Tests storybook is installed
5. ✅ Starts storybook automatically
6. ✅ Opens http://localhost:6006

No more "'sb' is not recognized" error!

---

## 📞 If Still Not Working

**Error**: Still getting "'sb' is not recognized"

Try these in order:

1. **Restart your computer** (clears PATH cache)
   
2. **Try again**: Double-click `setup.bat`

3. **Delete everything and start fresh**:
   ```bash
   Get-ChildItem -Exclude "src","public",".storybook",".*" | Remove-Item -Recurse -Force
   npm install --legacy-peer-deps
   npm run storybook
   ```

4. **Use direct node command**:
   ```bash
   node node_modules/storybook/bin/storybook.js dev -p 6006
   ```

---

## 📚 Updated Files

Files I updated for you:

- ✅ `package.json` - Fixed scripts to not use extra `npx`
- ✅ `setup.bat` - Windows batch file (double-click to run)
- ✅ `START_STORYBOOK.ps1` - PowerShell script
- ✅ This guide!

---

## 🎉 Next Steps

1. **Close this terminal window**

2. **Choose one method**:
   - 🟢 **EASIEST**: Double-click `setup.bat`
   - 🟡 **GOOD**: Run `.\START_STORYBOOK.ps1` in PowerShell 
   - 🔴 **MANUAL**: Paste commands in terminal

3. **Wait for Storybook to start**

4. **Open browser** to `http://localhost:6006`

5. **Done!** ✨

---

**That's it!** The "'sb' is not recognized" error should be completely fixed.
