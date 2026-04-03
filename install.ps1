#!/usr/bin/env pwsh

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Storybook Project Setup Script" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Check if npm is installed
Write-Host "Checking npm installation..." -ForegroundColor Yellow
$npmVersion = npm --version
Write-Host "✓ npm version: $npmVersion" -ForegroundColor Green
Write-Host ""

# Step 1: Install dependencies
Write-Host "Step 1: Installing dependencies..." -ForegroundColor Yellow
Write-Host "This may take 2-5 minutes..." -ForegroundColor Gray
Write-Host ""

npm install --legacy-peer-deps

if ($LASTEXITCODE -eq 0) {
    Write-Host ""
    Write-Host "✓ Dependencies installed successfully!" -ForegroundColor Green
    Write-Host ""
    
    # Step 2: Verify installation
    Write-Host "Step 2: Verifying installation..." -ForegroundColor Yellow
    Write-Host ""
    
    $sb_version = npm ls storybook --depth=0 2>$null | Select-String "storybook"
    Write-Host "✓ Storybook: $sb_version" -ForegroundColor Green
    
    Write-Host ""
    Write-Host "========================================" -ForegroundColor Green
    Write-Host "   Setup Complete! ✓" -ForegroundColor Green
    Write-Host "========================================" -ForegroundColor Green
    Write-Host ""
    Write-Host "Next: Run this command to start Storybook:" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   npm run storybook" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Then open browser to: http://localhost:6006" -ForegroundColor Cyan
    Write-Host ""
} else {
    Write-Host ""
    Write-Host "✗ Installation failed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Try these steps:" -ForegroundColor Yellow
    Write-Host "1. npm cache clean --force" -ForegroundColor Gray
    Write-Host "2. npm install --legacy-peer-deps" -ForegroundColor Gray
    Write-Host ""
}
