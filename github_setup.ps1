# AI Editor Pro — GitHub Initialization Script (PowerShell)

# 1. Initialize Git in the root folder
Write-Host "📂 Initializing Git repository in c:\Users\m\Downloads\editor..." -ForegroundColor Cyan
cd c:\Users\m\Downloads\editor

# Create .gitignore if it doesn't exist
if (-not (Test-Path .gitignore)) {
  @"
node_modules/
.next/
dist/
uploads/
outputs/
.env.local
.env.production
.firebase/
"@ | Out-File -FilePath .gitignore
}

git init
git add .
git commit -m "Initial commit: AI Editor Pro with AI Assistant and CapCut tools"

Write-Host "✅ Git initialized locally!" -ForegroundColor Green

# Instructions for GitHub
Write-Host "`n🚀 To upload to GitHub (HidHub):" -ForegroundColor Cyan
Write-Host "1. Create a new repository on GitHub (e.g. 'ai-editor-pro')."
Write-Host "2. Run these commands in this terminal:"
Write-Host "   git remote add origin https://github.com/YOUR_USERNAME/ai-editor-pro.git" -ForegroundColor Yellow
Write-Host "   git branch -M main" -ForegroundColor Yellow
Write-Host "   git push -u origin main" -ForegroundColor Yellow

Write-Host "`n🎉 Your website files are all in c:\Users\m\Downloads\editor" -ForegroundColor Green
