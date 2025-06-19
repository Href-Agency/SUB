#!/usr/bin/env node

import fs from 'fs';
import path from 'path';
import { glob } from 'glob';
import readline from 'readline';

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function question(prompt) {
  return new Promise((resolve) => {
    rl.question(prompt, resolve);
  });
}

async function setupTemplate() {
  console.log('🚀 Setting up your new Craft CMS project...\n');

  // Gather project information
  const config = {};
  
  config.PROJECT_NAME = await question('Project name: ');
  config.PROJECT_DESCRIPTION = await question('Project description: ');
  config.PROJECT_HANDLE = config.PROJECT_NAME.toLowerCase().replace(/[^a-z0-9]/g, '');
  config.PROJECT_URL = await question('Primary domain (e.g., mysite.com): ');
  
  config.COMPANY_NAME = await question('Company/Client name: ');
  config.COMPANY_EMAIL = await question('Company email: ');
  config.SUPPORT_EMAIL = config.COMPANY_EMAIL;
  
  config.AUTHOR_NAME = await question('Your name: ');
  config.AUTHOR_EMAIL = await question('Your email: ');
  config.REPOSITORY_URL = await question('Repository URL (optional): ') || '';
  
  config.DEV_URL = `https://${config.PROJECT_HANDLE}.ddev.site`;
  config.DEV_EMAIL = config.AUTHOR_EMAIL;
  config.STAGING_URL = await question(`Staging URL (default: https://staging.${config.PROJECT_URL}): `) || `https://staging.${config.PROJECT_URL}`;
  config.STAGING_EMAIL = config.COMPANY_EMAIL;
  config.PRODUCTION_URL = `https://${config.PROJECT_URL}`;
  config.PRODUCTION_EMAIL = config.COMPANY_EMAIL;
  
  // Add local path for deployment scripts (defaults to current directory)
  config.LOCAL_ROOT_PATH = process.cwd() + "/";

  console.log('\n📝 Updating files...');

  // Files that need template replacement
  const filesToUpdate = [
    'package.json',
    'composer.json',
    'config/project/project.yaml',
    'scripts/example.env.sh',
    'README.md',
    '.ddev/config.yaml'
  ];

  // Update each file
  for (const file of filesToUpdate) {
    if (fs.existsSync(file)) {
      let content = fs.readFileSync(file, 'utf8');
      
      // Replace all template variables
      Object.entries(config).forEach(([key, value]) => {
        const regex = new RegExp(`{{${key}}}`, 'g');
        content = content.replace(regex, value);
      });

      fs.writeFileSync(file, content);
      console.log(`✅ Updated ${file}`);
    }
  }

  // Clean up template files
  if (fs.existsSync('template.config.json')) {
    fs.unlinkSync('template.config.json');
  }
  if (fs.existsSync('setup-template.js')) {
    fs.unlinkSync('setup-template.js');
  }

  // Create .env.example content and copy to .env
  const envContent = `# The application ID used to to uniquely store session and cache data
CRAFT_APP_ID=${config.PROJECT_HANDLE}

# The environment Craft is currently running in (dev, staging, production, etc.)
CRAFT_ENVIRONMENT=dev

# The secure key Craft will use for hashing and encrypting data
CRAFT_SECURITY_KEY=

# Database connection settings (DDEV defaults)
CRAFT_DB_DRIVER=mysql
CRAFT_DB_SERVER=db
CRAFT_DB_PORT=3306
CRAFT_DB_DATABASE=db
CRAFT_DB_USER=db
CRAFT_DB_PASSWORD=db
CRAFT_DB_SCHEMA=public
CRAFT_DB_TABLE_PREFIX=

# Site URL settings (DDEV will handle this automatically)
PRIMARY_SITE_URL=https://${config.PROJECT_HANDLE}.ddev.site
CRAFT_PREVIEW_DOMAIN=https://${config.PROJECT_HANDLE}.ddev.site

# Asset settings
CRAFT_ASSETS_URL=\${PRIMARY_SITE_URL}/uploads

# Email settings (for development - uses DDEV's Mailpit)
CRAFT_FROM_EMAIL=${config.DEV_EMAIL}
CRAFT_FROM_NAME="${config.COMPANY_NAME}"

# Optional: Use DDEV's Mailpit for email testing
# CRAFT_MAILER_TRANSPORT_TYPE=smtp
# CRAFT_MAILER_HOST=localhost
# CRAFT_MAILER_PORT=1025`;

  // Write both .env.example and .env
  fs.writeFileSync('.env.example', envContent);
  fs.writeFileSync('.env', envContent);
  console.log('✅ Created .env.example and .env files');

  console.log('\n🎉 Template setup complete!');
  console.log('\nNext steps:');
  console.log('1. Run: ddev start');
  console.log('2. Run: ddev craft install');
  console.log('3. Access your site at: https://' + config.PROJECT_HANDLE + '.ddev.site');
  console.log('4. Access admin panel at: https://' + config.PROJECT_HANDLE + '.ddev.site/admin');
  console.log('5. Access Mailpit (email testing) at: https://' + config.PROJECT_HANDLE + '.ddev.site:8026');
  console.log('\nDDEV automatically handles:');
  console.log('- PHP/MySQL/Node.js setup');
  console.log('- Asset compilation (Vite runs automatically)');
  console.log('- Database configuration');
  console.log('- SSL certificates');

  rl.close();
}

setupTemplate().catch(console.error); 