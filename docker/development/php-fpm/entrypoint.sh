#!/bin/sh
set -e

# Clear configurations to avoid caching issues in development
echo "Clearing configurations..."
php artisan config:clear
echo "clear config DONE"
php artisan route:clear
echo "clear route DONE"
php artisan view:clear
echo "clear view DONE"

# Run the default command (e.g., php-fpm or bash)
exec "$@"
