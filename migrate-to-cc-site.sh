#!/bin/bash

# Migration script to replace cc-site branch with new Astro project
# Run this script from inside the 1460-dental-astro directory

echo "🚀 Starting migration to cc-site branch..."

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if we're in the right directory
if [ ! -f "package.json" ] || [ ! -f "astro.config.mjs" ]; then
    print_error "Please run this script from inside the 1460-dental-astro directory"
    exit 1
fi

print_status "Checking if git is initialized..."

# Initialize git if not already done
if [ ! -d ".git" ]; then
    print_status "Initializing git repository..."
    git init
    print_success "Git repository initialized"
fi

# Add the remote if it doesn't exist
REMOTE_URL="https://github.com/tdhelixx/1460-dental-studio-site.git"
if ! git remote get-url origin > /dev/null 2>&1; then
    print_status "Adding remote origin..."
    git remote add origin $REMOTE_URL
    print_success "Remote origin added"
else
    print_status "Remote origin already exists"
fi

# Fetch the latest changes
print_status "Fetching latest changes from remote..."
git fetch origin

# Check if cc-site branch exists locally
if git show-ref --verify --quiet refs/heads/cc-site; then
    print_warning "Local cc-site branch exists. It will be replaced."
else
    print_status "Creating local cc-site branch..."
fi

# Create a backup branch of current work
BACKUP_BRANCH="astro-migration-$(date +%Y%m%d-%H%M%S)"
print_status "Creating backup branch: $BACKUP_BRANCH"
git add .
git commit -m "Astro + Skeleton UI migration - backup before cc-site replacement" || print_warning "Nothing to commit"
git branch $BACKUP_BRANCH

# Switch to cc-site branch (create if doesn't exist)
print_status "Switching to cc-site branch..."
if git show-ref --verify --quiet refs/remotes/origin/cc-site; then
    git checkout -B cc-site origin/cc-site
else
    git checkout -b cc-site
fi

# Remove all existing content (except .git)
print_status "Clearing existing content from cc-site branch..."
find . -maxdepth 1 -not -name '.git' -not -name '.' -exec rm -rf {} + 2>/dev/null || true

# Copy all Astro project files
print_status "Copying new Astro project files..."
git checkout $BACKUP_BRANCH -- .

# Create .gitignore if it doesn't exist
if [ ! -f ".gitignore" ]; then
    print_status "Creating .gitignore..."
    cat > .gitignore << EOF
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
EOF
fi

# Stage all changes
print_status "Staging all changes..."
git add .

# Commit the migration
print_status "Committing Astro migration..."
git commit -m "🚀 Migrate to Astro + Skeleton UI

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
- TypeScript support"

print_success "Migration committed successfully!"

echo ""
print_status "Next steps:"
echo "1. Review the changes: ${YELLOW}git log --oneline -5${NC}"
echo "2. Push to remote: ${YELLOW}git push origin cc-site${NC}"
echo "3. Install dependencies: ${YELLOW}npm install${NC}"
echo "4. Start development: ${YELLOW}npm run dev${NC}"
echo "5. Deploy to CloudCannon (it will auto-detect the changes)"

echo ""
print_warning "Your backup is saved in branch: $BACKUP_BRANCH"
print_success "🎉 Migration to cc-site branch complete!" 