<?php

use craft\helpers\App;

// Use the current host for dev server requests. Otherwise fall back to the primary site.
$host = Craft::$app->getRequest()->getIsConsoleRequest()
    ? App::env('PRIMARY_SITE_URL')
    : Craft::$app->getRequest()->getHostInfo();

return [
    'devServerPublic' => "$host:3001", // Matches https_port in .ddev/config.yaml
    'serverPublic' => '/assets/',
    'useDevServer' => App::env('CRAFT_ENVIRONMENT') === 'dev',
    'manifestPath' => '@webroot/assets/.vite/manifest.json',
    // Optional if using React or Preact
    // 'includeReactRefreshShim' => true,
];