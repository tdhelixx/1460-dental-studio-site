import { skeleton } from '@skeletonlabs/skeleton/plugin';
import * as themes from '@skeletonlabs/skeleton/themes';

export default {
  content: [
    './src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}',
    './node_modules/@skeletonlabs/skeleton/**/*.{html,js,svelte,ts}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'heading': ['Montserrat', 'sans-serif'],
        'body': ['Open Sans', 'sans-serif'],
      },
      colors: {
        'primary': {
          50: '#e8f4fd',
          100: '#d1e9fb',
          200: '#a2d2f7',
          300: '#74bcf3',
          400: '#459cec',
          500: '#1e7ce8',
          600: '#186ab8',
          700: '#12578a',
          800: '#0c445c',
          900: '#06222e',
        },
        'secondary': {
          50: '#f8f9fa',
          100: '#f1f3f4',
          200: '#e3e6ea',
          300: '#d4d9df',
          400: '#c6ccd5',
          500: '#b8c0ca',
          600: '#93a0a8',
          700: '#6e7f86',
          800: '#495f64',
          900: '#243f42',
        },
      },
    },
  },
  plugins: [
    skeleton({
      themes: [themes.cerberus, themes.rose]
    })
  ],
}; 