#!/usr/bin/env ash

# import data into db

#/usr/bin/unzip /data/boston-crime-data.zip
#/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /home/$POSTGRES_USER/init.sql
#rm -rf /data/boston-crime-data
#

echo "COUCOU, C EST NOUS"

exec "$@"
