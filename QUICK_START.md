# Quick Start Guide - Storybook Testing Suite

## TL;DR - Get Started in 3 Steps

### Step 1: Install Dependencies
```bash
npm install --legacy-peer-deps
```
*(This will take 2-5 minutes)*

### Step 2: Start Storybook
```bash
npm run storybook
```

### Step 3: Open Browser
Visit: http://localhost:6006

---

## Complete Command Reference

### Installation & Setup
```bash
npm install --legacy-peer-deps        # Install all dependencies
npm cache clean --force                # Clear npm cache if needed
```

### Development
```bash
npm run dev                            # Start Vite dev server (http://localhost:5173)
npm run storybook                      # Start Storybook (http://localhost:6006)
npm test                               # Run Jest unit tests
npm test -- --watch                    # Run tests in watch mode
npm test -- --coverage                 # Run tests with coverage report
```

### Production Build
```bash
npm run build                          # Build main app for production
npm run build-storybook                # Build Storybook for deployment
npm run preview                        # Preview production build locally
```

### Code Quality
```bash
npm run lint                           # Check ESLint (if configured)
```

---

## What's Installed

### Core Framework
- **React** 18.2.0 - UI library
- **React DOM** 18.2.0 - React renderer
- **Vite** 5.0.0 - Build tool *(UPDATED for Storybook 10 compatibility)*

### Storybook
- **Storybook** 10.3.3 - Component documentation
- **@storybook/react-vite** 10.3.3 - React + Vite integration
- **@storybook/addon-essentials** 10.3.3 - Essential addons

### Testing
- **Jest** 29.7.0 - Test runner
- **@testing-library/react** 14.0.0 - React testing utilities
- **@testing-library/jest-dom** 6.0.0 - Custom matchers
- **@testing-library/user-event** 14.0.0 - User interaction simulation

### Build Tools
- **Babel** 7.22.0 - JavaScript compiler
- **@vitejs/plugin-react** 4.0.0 - React plugin for Vite
- **ESLint** 9.0.0 - Code linter

---

## Project Components

All components are located in `/src/components/` with corresponding stories and tests:

1. **Button** - Customizable button with variants and sizes
   - Component: `src/components/Button.jsx`
   - Story: `src/stories/Button.stories.jsx`
   - Test: `src/tests/Button.test.jsx`

2. **Card** - Title/description card component
   - Component: `src/components/Card.jsx`
   - Story: `src/stories/Card.stories.jsx`
   - Test: `src/tests/Card.test.jsx`

3. **Counter** - Interactive counter with increment
   - Component: `src/components/Counter.jsx`
   - Story: `src/stories/Counter.stories.jsx`
   - Test: `src/tests/Counter.test.jsx`

4. **Input** - Controlled text input component
   - Component: `src/components/Input.jsx`
   - Story: `src/stories/Input.stories.jsx`
   - Test: `src/tests/Input.test.jsx`

---

## Troubleshooting

### "Cannot find package @storybook/react-vite"
```bash
npm install --legacy-peer-deps
```

### "npm ERR! ERESOLVE unable to resolve dependency tree"
Use the legacy peer deps flag (older npm behavior):
```bash
npm install --legacy-peer-deps
```

### "Port 6006 already in use"
Use a different port:
```bash
npm run storybook -- -p 6007
```

### Tests failing after changes
Run tests in watch mode to see live updates:
```bash
npm test -- --watch
```

### Need to reset everything
```bash
Remove-Item -Recurse -Force node_modules
Remove-Item -Force package-lock.json
npm cache clean --force
npm install --legacy-peer-deps
```

---

## Package.json Key Dependencies

```json
{
  "dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0"
  },
  "devDependencies": {
    "vite": "^5.0.0",                               // UPDATED
    "storybook": "^10.3.3",
    "@storybook/react-vite": "^10.3.3",
    "@storybook/addon-essentials": "^10.3.3",
    "jest": "^29.7.0",
    "@testing-library/react": "^14.0.0",
    "@testing-library/jest-dom": "^6.0.0",
    "@vitejs/plugin-react": "^4.0.0"
  }
}
```

---

## Configuration Files

- `vite.config.mjs` - Vite build configuration
- `.storybook/main.mjs` - Storybook main config
- `.storybook/preview.mjs` - Storybook preview config
- `jest.config.cjs` - Jest test configuration
- `babel.config.cjs` - Babel transpiler config
- `eslint.config.mjs` - ESLint linter config

---

## Resources

- [Storybook Docs](https://storybook.js.org/)
- [Vite Docs](https://vitejs.dev/)
- [React Docs](https://react.dev/)
- [Jest Docs](https://jestjs.io/)
- [React Testing Library](https://testing-library.com/react)

---

**Last Updated**: April 2, 2026
**Status**: ✅ Ready for deployment
