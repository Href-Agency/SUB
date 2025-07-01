import { defineConfig, loadEnv } from 'vite'
import sassGlobImports from 'vite-plugin-sass-glob-import';

// Match ports in .ddev/config.yaml and config/vite.php
const HTTP_PORT = 3000
const HTTPS_PORT = 3001

export default defineConfig(({ command, mode }) => {
  const env = loadEnv(mode, process.cwd(), '')

  return {
    // In dev mode, we serve assets at the root of https://my.ddev.site:3000
    // In production, files live in the /dist directory
    base: command === 'serve' ? '' : '/dist/',
    build: {
      manifest: true,
      // Where your production files end up
      outDir: './public/assets/',
      rollupOptions: {
        input: {
          // The entry point for Vite, we'll create this file soon
          app: 'assets/javascript/app.js',
        },
      },
    },
    plugins: [
      sassGlobImports(),
    ],
    server: {
      // Special address that respond to all network requests
      host: '0.0.0.0',
      // Use a strict port because we have to hard code this in vite.php
      strictPort: true,
      // This is the port running "inside" the Web container
      // It's the same as continer_port in .ddev/config.yaml
      port: HTTP_PORT,
      // Set origin to match the HTTPS proxy that Craft expects
      origin: `https://sub.ddev.site:${HTTPS_PORT}`,
      // Enable CORS for DDEV
      cors: true,
      // Enable HMR - Use HTTPS port with nginx WebSocket proxying
      hmr: {
        port: HTTP_PORT,
        host: 'sub.ddev.site',
        clientPort: HTTPS_PORT
      }
    },
  }
})