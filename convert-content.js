#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Configuration
const OLD_SITE_DIR = '../rescue-cannon/site_output';
const NEW_SITE_DIR = './src/pages';
const SERVICES_DIR = './src/content/services';
const TEAM_DIR = './src/content/team';

// Utility functions
function extractYamlFrontMatter(content) {
  const frontMatterRegex = /^---\s*\n([\s\S]*?)\n---\s*\n/;
  const match = content.match(frontMatterRegex);
  
  if (match) {
    return {
      frontMatter: match[1],
      content: content.substring(match[0].length)
    };
  }
  
  return {
    frontMatter: '',
    content: content
  };
}

function extractEditableContent(htmlContent) {
  const editableRegex = /class="editable"[^>]*>([\s\S]*?)<\/[^>]+>/g;
  const editableContent = [];
  let match;
  
  while ((match = editableRegex.exec(htmlContent)) !== null) {
    editableContent.push(match[1].trim());
  }
  
  return editableContent;
}

function convertHtmlToAstro(htmlPath, outputPath) {
  console.log(`Converting ${htmlPath} to ${outputPath}`);
  
  try {
    const content = fs.readFileSync(htmlPath, 'utf8');
    const { frontMatter, content: htmlContent } = extractYamlFrontMatter(content);
    
    // Create Astro component
    const astroContent = `---
${frontMatter}
import PageLayout from '../layouts/PageLayout.astro';
---

<PageLayout 
  title={frontmatter.title}
  description={frontmatter.description}
>
  <!-- Content extracted from ${path.basename(htmlPath)} -->
  ${htmlContent}
</PageLayout>
`;
    
    // Ensure output directory exists
    const outputDir = path.dirname(outputPath);
    if (!fs.existsSync(outputDir)) {
      fs.mkdirSync(outputDir, { recursive: true });
    }
    
    // Write the Astro file
    fs.writeFileSync(outputPath, astroContent);
    console.log(`✅ Converted ${htmlPath} to ${outputPath}`);
    
  } catch (error) {
    console.error(`❌ Error converting ${htmlPath}:`, error.message);
  }
}

function convertServicesToMarkdown(servicesDir) {
  console.log('\n📋 Converting services to markdown...');
  
  const servicesPath = path.join(OLD_SITE_DIR, 'services');
  if (!fs.existsSync(servicesPath)) {
    console.log('❌ Services directory not found');
    return;
  }
  
  // Ensure services content directory exists
  if (!fs.existsSync(SERVICES_DIR)) {
    fs.mkdirSync(SERVICES_DIR, { recursive: true });
  }
  
  const services = fs.readdirSync(servicesPath);
  
  services.forEach(service => {
    const servicePath = path.join(servicesPath, service);
    const indexPath = path.join(servicePath, 'index.html');
    
    if (fs.existsSync(indexPath)) {
      const content = fs.readFileSync(indexPath, 'utf8');
      const { frontMatter } = extractYamlFrontMatter(content);
      
      // Create markdown file
      const markdownPath = path.join(SERVICES_DIR, `${service}.md`);
      const markdownContent = `---
${frontMatter}
---

<!-- Service content will be migrated here -->
<!-- Original path: ${servicePath} -->
`;
      
      fs.writeFileSync(markdownPath, markdownContent);
      console.log(`✅ Created service: ${service}.md`);
    }
  });
}

function createMigrationReport() {
  console.log('\n📊 Creating migration report...');
  
  const report = {
    timestamp: new Date().toISOString(),
    summary: {
      totalPages: 0,
      convertedPages: 0,
      services: 0,
      errors: []
    },
    recommendations: [
      'Review all converted pages for proper Astro component structure',
      'Update image paths to use Astro\'s asset optimization',
      'Test all forms and interactive elements',
      'Implement proper error handling for missing pages',
      'Add proper TypeScript types for all components',
      'Optimize images using Astro\'s image optimization',
      'Set up proper SEO metadata for all pages'
    ],
    nextSteps: [
      'Run `npm install` to install all dependencies',
      'Start development server with `npm run dev`',
      'Review and customize the Skeleton UI theme',
      'Test all converted pages thoroughly',
      'Configure CloudCannon for content management',
      'Deploy to production environment'
    ]
  };
  
  fs.writeFileSync('./migration-report.json', JSON.stringify(report, null, 2));
  console.log('✅ Migration report created: migration-report.json');
}

// Main conversion function
function main() {
  console.log('🚀 Starting content conversion from HTML to Astro...\n');
  
  // Check if old site directory exists
  if (!fs.existsSync(OLD_SITE_DIR)) {
    console.error(`❌ Old site directory not found: ${OLD_SITE_DIR}`);
    console.log('Please update the OLD_SITE_DIR path in this script.');
    return;
  }
  
  // Convert main pages
  const mainPages = [
    'index.html',
    'about/index.html',
    'contact/index.html'
  ];
  
  mainPages.forEach(page => {
    const sourcePath = path.join(OLD_SITE_DIR, page);
    const targetPath = path.join(NEW_SITE_DIR, page.replace('.html', '.astro'));
    
    if (fs.existsSync(sourcePath)) {
      convertHtmlToAstro(sourcePath, targetPath);
    } else {
      console.log(`⚠️  Page not found: ${sourcePath}`);
    }
  });
  
  // Convert services
  convertServicesToMarkdown();
  
  // Create migration report
  createMigrationReport();
  
  console.log('\n🎉 Content conversion complete!');
  console.log('\nNext steps:');
  console.log('1. Run `npm install` to install dependencies');
  console.log('2. Run `npm run dev` to start development server');
  console.log('3. Review converted pages at http://localhost:4321');
  console.log('4. Customize components and styling as needed');
  console.log('5. Deploy to CloudCannon for CMS integration');
}

// Run the conversion
main(); 