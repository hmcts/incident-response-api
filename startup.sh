#! /bin/bash

wait_for_db()
{
    while ! nc -z ${DB_HOST:-db} ${DB_PORT:-5432};
    do sleep 1;
    done;
}

echo "[INFO] Waiting for DB"
wait_for_db

echo "[INFO] Migrating database"
cd /app
python3 ./incidentresponse/manage.py migrate --noinput

echo "[INFO] Starting Response Dev Server"
python3 ./incidentresponse/manage.py runserver 0.0.0.0:8000
