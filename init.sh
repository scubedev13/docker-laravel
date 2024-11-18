#!/bin/bash

# Start PHP-FPM in the background
php-fpm &

# Set correct permissions for storage directory
chmod -R 775 /var/www/html/storage
chown -R www-data:www-data /var/www/html/storage

# Update Composer dependencies
composer update

# Run Artisan commands for database and session table
php artisan session:table
php artisan migrate

# Generate application key
php artisan key:generate
