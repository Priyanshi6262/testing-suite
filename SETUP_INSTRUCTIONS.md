# Storybook Project Setup Instructions

## Issue
The project has Storybook version 10.3.3 dependencies that conflict with the old Vite version (^4.5.0). Storybook 10.3.3 requires Vite ^5.0.0 or higher.

## Solution

### Step 1: Install Dependencies with Legacy Peer Deps
Run the following command in your terminal (in the project directory):

```bash
npm install --legacy-peer-deps
```

**Why?** This allows npm to install packages even though there are peer dependency version conflicts. The --legacy-peer-deps flag is necessary because Storybook 10.3.3 requires Vite 5.x, but the configuration may need adjustment.

### Step 2: Verify Installation
After installation completes, verify all packages are installed:

```bash
npm ls @storybook/react-vite
npm ls @storybook/addon-essentials
npm ls vite
```

### Step 3: Start Storybook
Once dependencies are installed:

```bash
npm run storybook
```

This will start Storybook dev server on port 6006.

### Step 4: Run Tests
```bash
npm test
```

### Step 5: Run Main App
```bash
npm run dev
```

## Troubleshooting

If you still get "Cannot find package" errors:

1. **Clear npm cache:**
   ```bash
   npm cache clean --force
   ```

2. **Delete node_modules and reinstall:**
   ```bash
   rm -r node_modules package-lock.json
   npm install --legacy-peer-deps
   ```

3. **Check Node/npm versions:**
   ```bash
   node --version
   npm --version
   ```
   (Node 18+ recommended, npm 9+ recommended)

## Project Structure
- `/src/components/` - React components (Button, Card, Counter, Input)
- `/src/stories/` - Storybook stories for each component
- `/src/tests/` - Jest unit tests for each component
- `/.storybook/` - Storybook configuration

## Available Scripts
- `npm run dev` - Start Vite dev server
- `npm run build` - Build for production
- `npm run storybook` - Start Storybook dev server
- `npm test` - Run Jest tests
- `npm run build-storybook` - Build Storybook for deployment

## All Dependencies Are Correctly Configured
✅ React 18.2.0
✅ Vite 5.0.0 (updated from 4.5.0)
✅ Storybook 10.3.3
✅ Jest 29.7.0
✅ React Testing Library 14.0.0
✅ All Storybook addons
