#!/usr/bin/env bash

# import data into db
echo "Starting data importation"

/usr/bin/unzip -d /data /data/boston-crime-data.zip
/usr/bin/unzip -d /data /data/mpi.zip
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/boston_init.sql
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/mpi.sql

# cleanup data
rm -rf /data/boston-crime-data
rm -rf /data/MPI_national.csv
rm -rf /data/MPI_subnational.csv

echo "Finished loading data"
