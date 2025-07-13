# 1460 Dental Studio - Astro + Skeleton

A modern, fast, and beautiful dental practice website built with Astro and Skeleton UI components. This project converts the existing 1460 Dental Studio site to a modern tech stack while maintaining all functionality and improving performance.

## ✨ Features

- **Modern Tech Stack**: Built with Astro for optimal performance and SEO
- **Beautiful UI**: Skeleton UI components for a polished, professional look
- **Mobile-First**: Responsive design that works perfectly on all devices
- **CMS Integration**: Full CloudCannon CMS support for easy content management
- **SEO Optimized**: Built-in SEO best practices and meta tag management
- **Fast Performance**: Astro's static site generation for lightning-fast load times
- **Accessible**: WCAG compliant components and semantic HTML
- **Dark Mode**: Built-in dark/light mode switching

## 🚀 Quick Start

### Prerequisites

- Node.js 18.14.1 or higher
- npm, pnpm, or yarn

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd 1460-dental-astro
   ```

2. **Install dependencies**
   ```bash
   npm install
   # or
   pnpm install
   # or
   yarn install
   ```

3. **Start development server**
   ```bash
   npm run dev
   # or
   pnpm dev
   # or
   yarn dev
   ```

4. **Open in browser**
   Visit `http://localhost:4321` to see the site

## 🏗️ Build and Deploy

### Build for Production

```bash
npm run build
```

The built site will be in the `dist/` directory.

### Preview Production Build

```bash
npm run preview
```

### Deploy to CloudCannon

1. **Connect your repository** to CloudCannon
2. **Configure build settings**:
   - Build command: `npm run build`
   - Output directory: `dist`
   - Install command: `npm install`
3. **Enable visual editing** with the included CloudCannon configuration

## 📁 Project Structure

```
1460-dental-astro/
├── src/
│   ├── components/          # Reusable UI components
│   │   ├── Navigation.svelte
│   │   ├── Footer.astro
│   │   ├── HeroSection.astro
│   │   └── ServiceGrid.astro
│   ├── content/             # Content collections
│   │   ├── services/        # Service pages
│   │   └── team/           # Team member profiles
│   ├── layouts/             # Page layouts
│   │   ├── BaseLayout.astro
│   │   └── PageLayout.astro
│   ├── pages/               # Site pages
│   │   ├── index.astro      # Homepage
│   │   ├── about/
│   │   ├── services/
│   │   ├── contact/
│   │   └── [...all other pages]
│   ├── data/                # Data files
│   │   ├── navigation.yml
│   │   └── site.yml
│   └── app.css              # Global styles
├── public/                  # Static assets
├── cloudcannon.config.yml   # CMS configuration
├── astro.config.mjs         # Astro configuration
├── tailwind.config.mjs      # Tailwind CSS configuration
└── package.json
```

## 🎨 Customization

### Theming

The site uses Skeleton UI's theming system. You can customize colors, fonts, and spacing in `tailwind.config.mjs`:

```javascript
// tailwind.config.mjs
export default {
  theme: {
    extend: {
      colors: {
        'primary': {
          // Your custom primary colors
        }
      }
    }
  }
}
```

### Components

All components are built using Skeleton UI and can be easily customized:

- **Navigation**: `src/components/Navigation.svelte`
- **Hero Section**: `src/components/HeroSection.astro`
- **Service Grid**: `src/components/ServiceGrid.astro`
- **Footer**: `src/components/Footer.astro`

### Content Management

Content is managed through:

1. **Page Content**: Edit directly in `.astro` files or through CloudCannon
2. **Service Pages**: Content collections in `src/content/services/`
3. **Team Members**: Content collections in `src/content/team/`
4. **Site Data**: Global data in `src/data/`

## 🔧 Development

### Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run astro` - Run Astro CLI commands

### Key Technologies

- **[Astro](https://astro.build)** - Static site generator
- **[Skeleton UI](https://skeleton.dev)** - UI component library
- **[Svelte](https://svelte.dev)** - Component framework
- **[Tailwind CSS](https://tailwindcss.com)** - Utility-first CSS framework
- **[CloudCannon](https://cloudcannon.com)** - Git-based CMS

## 📝 Content Migration

The site includes all content from the original 1460 Dental Studio website:

- ✅ **48 pages** converted to Astro components
- ✅ **30+ services** with detailed descriptions
- ✅ **Team member profiles** with photos and bios
- ✅ **Contact information** and forms
- ✅ **Navigation structure** maintained
- ✅ **SEO metadata** preserved
- ✅ **Image optimization** included

## 🚀 Performance Benefits

Compared to the original WordPress site:

- **Faster load times** (Astro static generation)
- **Better SEO** (optimized meta tags and structure)
- **Improved security** (no database or server-side vulnerabilities)
- **Enhanced user experience** (Skeleton UI components)
- **Mobile optimization** (responsive design)
- **Accessibility improvements** (WCAG compliant components)

## 📧 Support

For questions or issues:

- Check the [Astro documentation](https://docs.astro.build)
- Review [Skeleton UI docs](https://skeleton.dev/docs)
- Contact the development team

## 📄 License

This project is proprietary to 1460 Dental Studio.

---

**Built with ❤️ using Astro + Skeleton UI** 