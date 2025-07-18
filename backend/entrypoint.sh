#!/bin/sh

# Exit script on any error
set -e

# Apply database migrations
echo "Applying database migrations..."
python manage.py migrate --noinput

# Collect static files (optional)
# echo "Collecting static files..."
# python manage.py collectstatic --noinput

# Start the server
echo "Starting server..."
exec "$@"
