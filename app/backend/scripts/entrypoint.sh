#!/bin/bash

# Wait for the database to be ready
scripts/wait-for-it.sh db:5432

# Collect static files
echo "Collect static files"
python manage.py collectstatic --noinput

# Apply database migrations
echo "Apply database migrations"
python manage.py migrate

# Create a superuser and display the credentials
DJANGO_SUPERUSER_USERNAME=admin
DJANGO_SUPERUSER_PASSWORD='Devops2023**'
DJANGO_SUPERUSER_EMAIL=ta@ta.ta
python manage.py shell <<EOF
from django.contrib.auth import get_user_model

User = get_user_model()
try:
    User.objects.get(username='$DJANGO_SUPERUSER_USERNAME')
    print('Superuser already exists')
except User.DoesNotExist:
    User.objects.create_superuser('$DJANGO_SUPERUSER_USERNAME', '$DJANGO_SUPERUSER_EMAIL', '$DJANGO_SUPERUSER_PASSWORD')
    print('Superuser created')

EOF
echo "Superuser created:"
echo "Username: $DJANGO_SUPERUSER_USERNAME"
echo "Password: $DJANGO_SUPERUSER_PASSWORD"

# Start server
echo "Starting server"
python manage.py runserver 0.0.0.0:8000