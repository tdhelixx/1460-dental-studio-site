# PowerShell Migration script to replace cc-site branch with new Astro project
# Run this script from inside the 1460-dental-astro directory

Write-Host "🚀 Starting migration to cc-site branch..." -ForegroundColor Blue

# Function to print colored output
function Write-Status {
    param($Message)
    Write-Host "[INFO] $Message" -ForegroundColor Blue
}

function Write-Success {
    param($Message)
    Write-Host "[SUCCESS] $Message" -ForegroundColor Green
}

function Write-Warning {
    param($Message)
    Write-Host "[WARNING] $Message" -ForegroundColor Yellow
}

function Write-Error {
    param($Message)
    Write-Host "[ERROR] $Message" -ForegroundColor Red
}

# Check if we're in the right directory
if (!(Test-Path "package.json") -or !(Test-Path "astro.config.mjs")) {
    Write-Error "Please run this script from inside the 1460-dental-astro directory"
    exit 1
}

Write-Status "Checking if git is initialized..."

# Initialize git if not already done
if (!(Test-Path ".git")) {
    Write-Status "Initializing git repository..."
    git init
    Write-Success "Git repository initialized"
}

# Add the remote if it doesn't exist
$RemoteUrl = "https://github.com/tdhelixx/1460-dental-studio-site.git"
try {
    $currentRemote = git remote get-url origin 2>$null
    if (!$currentRemote) {
        Write-Status "Adding remote origin..."
        git remote add origin $RemoteUrl
        Write-Success "Remote origin added"
    } else {
        Write-Status "Remote origin already exists"
    }
} catch {
    Write-Status "Adding remote origin..."
    git remote add origin $RemoteUrl
    Write-Success "Remote origin added"
}

# Fetch the latest changes
Write-Status "Fetching latest changes from remote..."
git fetch origin

# Check if cc-site branch exists locally
$ccSiteExists = git branch --list cc-site
if ($ccSiteExists) {
    Write-Warning "Local cc-site branch exists. It will be replaced."
} else {
    Write-Status "Will create local cc-site branch..."
}

# Create a backup branch of current work
$BackupBranch = "astro-migration-$(Get-Date -Format 'yyyyMMdd-HHmmss')"
Write-Status "Creating backup branch: $BackupBranch"
git add .
git commit -m "Astro + Skeleton UI migration - backup before cc-site replacement"
if ($LASTEXITCODE -ne 0) {
    Write-Warning "Nothing new to commit"
}
git branch $BackupBranch

# Switch to cc-site branch (create if doesn't exist)
Write-Status "Switching to cc-site branch..."
$remoteCcSite = git ls-remote --heads origin cc-site
if ($remoteCcSite) {
    git checkout -B cc-site origin/cc-site
} else {
    git checkout -b cc-site
}

# Remove all existing content (except .git)
Write-Status "Clearing existing content from cc-site branch..."
Get-ChildItem -Path . -Exclude ".git" | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue

# Copy all Astro project files
Write-Status "Copying new Astro project files..."
git checkout $BackupBranch -- .

# Create .gitignore if it doesn't exist
if (!(Test-Path ".gitignore")) {
    Write-Status "Creating .gitignore..."
    @"
# Dependencies
node_modules/
.pnpm-debug.log*

# Build outputs
dist/
.astro/

# Environment variables
.env
.env.local
.env.production

# MacOS
.DS_Store

# IDEs
.vscode/
.idea/
*.swp
*.swo

# Logs
*.log
npm-debug.log*
yarn-debug.log*
yarn-error.log*

# CloudCannon
.cloudcannon/

# Temporary files
.tmp/
.cache/
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8
}

# Stage all changes
Write-Status "Staging all changes..."
git add .

# Commit the migration
Write-Status "Committing Astro migration..."
$commitMessage = @"
🚀 Migrate to Astro + Skeleton UI

- Complete rewrite using modern Astro static site generator
- Implement Skeleton UI component library for better UX
- Add Svelte components for interactivity
- Maintain all original content and functionality
- Optimize for performance and SEO
- CloudCannon CMS ready configuration
- Mobile-first responsive design
- Dark mode support
- Accessibility improvements

Migration includes:
- 48 pages converted to Astro components
- Modern navigation with dropdowns
- Professional hero section
- Service grid with cards
- Contact forms and info
- SEO optimization
- Image optimization ready
- TypeScript support
"@

git commit -m $commitMessage

Write-Success "Migration committed successfully!"

Write-Host ""
Write-Status "Next steps:"
Write-Host "1. Review the changes: " -NoNewline; Write-Host "git log --oneline -5" -ForegroundColor Yellow
Write-Host "2. Push to remote: " -NoNewline; Write-Host "git push origin cc-site" -ForegroundColor Yellow  
Write-Host "3. Install dependencies: " -NoNewline; Write-Host "npm install" -ForegroundColor Yellow
Write-Host "4. Start development: " -NoNewline; Write-Host "npm run dev" -ForegroundColor Yellow
Write-Host "5. Deploy to CloudCannon (it will auto-detect the changes)"

Write-Host ""
Write-Warning "Your backup is saved in branch: $BackupBranch"
Write-Success "🎉 Migration to cc-site branch complete!" 