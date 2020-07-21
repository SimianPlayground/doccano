#!/usr/bin/env bash

set -o errexit
python app/manage.py wait_for_db
python app/manage.py migrate
python app/manage.py create_roles

if [ -n "$ADMIN_USER_NAME" ]; then
    python app/manage.py create_admin --noinput --username="$ADMIN_USER_NAME" --email="$ADMIN_CONTACT_EMAIL" --password="$ADMIN_PASSWORD"
fi
