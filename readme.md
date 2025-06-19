# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

This is a Craft CMS project built with modern tooling and best practices.

## 📋 Requirements

- [DDEV](https://ddev.readthedocs.io/en/stable/) - Local development environment
- [Docker](https://www.docker.com/) - DDEV dependency  
- [Node.js](https://nodejs.org/) - For the setup script (Node 18+)

## 🚀 Quick Start

1. **Setup the project:**
   ```bash
   npm run setup
   # or: node setup-template.js
   ```

2. **Start DDEV:**
   ```bash
   ddev start
   ```

3. **Install Craft CMS:**
   ```bash
   ddev craft install
   ```

4. **Access your site:**
   - **Frontend:** https://[project-handle].ddev.site
   - **Admin Panel:** https://[project-handle].ddev.site/admin  
   - **Mailpit (Email Testing):** https://[project-handle].ddev.site:8026

**That's it!** DDEV automatically handles PHP, MySQL, Node.js, asset compilation, and SSL certificates.

## 🛠 Technology Stack

- **CMS:** Craft CMS 5.x
- **Development Environment:** DDEV (Docker-based)
- **Build Tool:** Vite (auto-compiles in DDEV)
- **CSS:** TailwindCSS + SCSS
- **JavaScript:** Vanilla JS with modern libraries
- **Email Testing:** Mailpit (built into DDEV)
- **Deployment:** Scripts for staging/production

## 📁 Project Structure

```
├── .ddev/                  # DDEV configuration
├── assets/                 # Frontend assets
│   ├── javascript/         # JS files
│   └── sass/              # SCSS files
├── config/                # Craft CMS configuration
├── modules/               # Custom modules
├── scripts/               # Deployment scripts
├── templates/             # Twig templates
├── public/                # Web root (DDEV docroot)
├── .env.example           # Environment template
└── vite.config.js         # Vite configuration (auto-runs in DDEV)
```

## 🎨 Available Fields & Components

This template includes pre-configured:
- **Fields:** Button, Navigation, Heading, Text, Image/Video, etc.
- **Entry Types:** Pages, Navigation Items, Posts
- **Global Sets:** Header, Footer
- **Sections:** Homepage, Pages

## 📝 Development

### DDEV Commands
- `ddev start` - Start the development environment
- `ddev stop` - Stop the development environment
- `ddev restart` - Restart the environment
- `ddev craft` - Run Craft CLI commands
- `ddev ssh` - SSH into the web container
- `ddev logs` - View container logs

### Build & Deploy
- `ddev exec npm run build` - Build for production
- `ddev craft migrate/all` - Run database migrations
- `ddev craft project-config/sync` - Sync project config

### Useful Development URLs
- **Frontend:** https://[project-handle].ddev.site
- **Admin:** https://[project-handle].ddev.site/admin
- **Database Admin:** https://[project-handle].ddev.site:8037
- **Mailpit:** https://[project-handle].ddev.site:8026

## 🚀 Deployment

DDEV-compatible scripts are included for deployment workflows:
- `scripts/pull_db.sh` - Pull database from remote
- `scripts/pull_assets.sh` - Pull assets from remote  
- `scripts/backup_*.sh` - Backup scripts

**Setup:** Copy `scripts/example.env.sh` to `scripts/.env.sh` and configure your remote server details. The scripts are pre-configured to work with DDEV's database commands.

## 📧 Contact

**Project:** {{PROJECT_NAME}}  
**Author:** {{AUTHOR_NAME}}  
**Email:** {{AUTHOR_EMAIL}}

---

Built with ❤️ using Craft CMS
