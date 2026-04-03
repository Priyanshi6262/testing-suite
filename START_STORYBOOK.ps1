#!/usr/bin/env pwsh

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   STORYBOOK FIX & START SCRIPT" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Step 1: Full npm install
Write-Host "Step 1: Installing dependencies (this takes 2-5 minutes)..." -ForegroundColor Yellow
Write-Host "Please wait and do NOT interrupt..." -ForegroundColor Red
Write-Host ""

npm install --legacy-peer-deps

if ($LASTEXITCODE -ne 0) {
    Write-Host "ERROR: npm install failed" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try running manually:" -ForegroundColor Yellow
    Write-Host "  npm install --legacy-peer-deps" -ForegroundColor Cyan
    exit 1
}

Write-Host ""
Write-Host "✓ Dependencies installed successfully!" -ForegroundColor Green
Write-Host ""

# Step 2: Verify storybook is available
Write-Host "Step 2: Verifying storybook installation..." -ForegroundColor Yellow
$sb_version = npm list storybook --depth=0 2>$null | Select-String "storybook"
Write-Host "Found: $sb_version" -ForegroundColor Green
Write-Host ""

# Step 3: Start storybook
Write-Host "Step 3: Starting Storybook..." -ForegroundColor Yellow
Write-Host "Opening: http://localhost:6006" -ForegroundColor Cyan
Write-Host ""
Write-Host "Press Ctrl+C to stop Storybook" -ForegroundColor Gray
Write-Host ""

npm run storybook

