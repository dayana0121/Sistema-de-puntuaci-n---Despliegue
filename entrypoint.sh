#!/bin/bash

echo "Waiting for database $MYSQL_HOST:$MYSQL_PORT..."
MYSQL_HOST=${MYSQL_HOST:-db}
MYSQL_PORT=${MYSQL_PORT:-3306}

until nc -z "$MYSQL_HOST" "$MYSQL_PORT"; do
  echo "DB not ready, sleeping..."
  sleep 2
done

echo "Running migrations..."
python manage.py migrate --noinput

echo "Checking if database needs to be populated..."
# Verificar si la tabla users_user tiene datos
USER_COUNT=$(python manage.py shell -c "
from django.db import connection
cursor = connection.cursor()
cursor.execute('SELECT COUNT(*) FROM users_user')
count = cursor.fetchone()[0]
print(count)
" 2>/dev/null | tail -1)

if [ "$USER_COUNT" -eq "0" ]; then
    echo "Database is empty, importing initial data..."
    # Importar la base de datos desde el archivo SQL
    mariadb -h "$MYSQL_HOST" -P "$MYSQL_PORT" -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < /app/Puntaje_db.sql
    echo "Database imported successfully!"
else
    echo "Database already has data ($USER_COUNT users found), skipping import."
fi

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting gunicorn..."
exec gunicorn config.wsgi:application --bind 0.0.0.0:5001 --workers 3 --timeout 60 --graceful-timeout 60


