#!/usr/bin/env bash

# import data into db

/usr/bin/unzip /docker-entrypoint-initdb.d/boston-crime-data.zip
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /docker-entrypoint-initdb.d/init.sql
rm -rf /docker-entrypoint-initdb.d/boston-crime-data
rm -rf /docker-entrypoint-initdb.d/boston-crime-data.zip

echo "Finished loading data"

exec "$@"
