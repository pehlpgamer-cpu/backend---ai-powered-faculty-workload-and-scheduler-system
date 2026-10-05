#!/bin/sh

set -e

echo "Initializing Laravel container..."

# Initialize storage if the persistent volume is empty.
if [ ! "$(ls -A /var/www/storage)" ]; then
    echo "Initializing storage directory..."

    cp -R /var/www/storage-init/. /var/www/storage
    chown -R www-data:www-data /var/www/storage
fi

rm -rf /var/www/storage-init

echo "Running database migrations..."
php artisan migrate --force

echo "Caching Laravel configuration..."
php artisan config:cache

echo "Caching Laravel routes..."
php artisan route:cache

echo "Starting PHP-FPM..."
exec "$@"
