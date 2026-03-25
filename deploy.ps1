# AI Editor Pro — Deployment Script (PowerShell)

# 1. Deploy Backend (Google Cloud Run)
Write-Host "🚀 Deploying Backend to Cloud Run..." -ForegroundColor Cyan
cd c:\Users\m\Downloads\editor\backend
gcloud builds submit --tag gcr.io/hudhib/ai-editor-backend
gcloud run deploy ai-editor-backend --image gcr.io/hudhib/ai-editor-backend --platform managed --region us-central1 --allow-unauthenticated

# Get the Backend URL
$BACKEND_URL = gcloud run services describe ai-editor-backend --platform managed --region us-central1 --format 'value(status.url)'
Write-Host "✅ Backend deployed at: $BACKEND_URL" -ForegroundColor Green

# 2. Deploy Frontend (Firebase Hosting)
Write-Host "🌐 Deploying Frontend to Firebase..." -ForegroundColor Cyan
cd c:\Users\m\Downloads\editor\frontend
# Update production API URL
$env:NEXT_PUBLIC_API_URL = $BACKEND_URL
npm run build
firebase deploy --only hosting --project hudhib

Write-Host "🎉 Deployment Complete!" -ForegroundColor Green
Write-Host "Your Hostlink: https://hudhib.web.app" -ForegroundColor Yellow
