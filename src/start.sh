#!/bin/sh
set -e
python manage.py migrate --noinput
python manage.py bootstrap
exec gunicorn crm.wsgi:application --bind 0.0.0.0:${PORT:-10000} --workers 2 --timeout 120
