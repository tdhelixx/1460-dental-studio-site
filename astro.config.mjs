import { defineConfig } from 'astro/config';
import svelte from '@astrojs/svelte';
import tailwind from '@astrojs/tailwind';

export default defineConfig({
  integrations: [
    svelte(),
    tailwind({
      applyBaseStyles: false,
    }),
  ],
  output: 'static',
  build: {
    format: 'preserve',
  },
  site: 'https://1460dentalstudio.com',
  compressHTML: true,
  vite: {
    optimizeDeps: {
      include: ['@skeletonlabs/skeleton']
    }
  }
}); 