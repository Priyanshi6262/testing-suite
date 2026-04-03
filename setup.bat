@echo off
REM Storybook Project Setup for Windows
REM This script will install all dependencies and start Storybook

.

echo ========================================
echo    STORYBOOK FIX AND START
echo ========================================
echo.

echo Checking npm...
npm --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: npm is not installed
    pause
    exit /b 1
)

echo.
echo ========================================
echo Step 1: Installing Dependencies
echo ========================================
echo This may take 2-5 minutes...
echo DO NOT INTERRUPT - Let it finish completely!
echo.

call npm install --legacy-peer-deps

if errorlevel 1 (
    echo.
    echo [ERROR] npm install failed!
    echo.
    echo Try these steps:
    echo   1. npm cache clean --force
    echo   2. npm install --legacy-peer-deps
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo Step 2: Verifying Installation
echo ========================================
echo.

npm list storybook --depth=0

echo.
echo ========================================
echo Step 3: Starting Storybook
echo ========================================
echo.
echo Opening Storybook at: http://localhost:6006
echo Press Ctrl+C to stop
echo.

call npm run storybook

pause
