#!/usr/bin/env bash

# import data into db
echo "Starting data importation"

mkdir /data/population
mkdir /data/mpi

/usr/bin/unzip -d /data /data/boston-crime-data.zip
/usr/bin/unzip -d /data/mpi /data/mpi.zip
/usr/bin/unzip -d /data/population /data/population.zip
/usr/bin/unzip -d /data/corruption /data/corruption.zip

# clean noisy CSV
sed -i '1,4d' /data/population/API_SP.POP.TOTL_DS2_en_csv_v2_511378.csv
sed -i 's/, /_/g' /data/population/API_SP.POP.TOTL_DS2_en_csv_v2_511378.csv
sed -i 's/\"//g' /data/population/API_SP.POP.TOTL_DS2_en_csv_v2_511378.csv
sed -i 's/..$//g' /data/population/API_SP.POP.TOTL_DS2_en_csv_v2_511378.csv

/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/boston_init.sql
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/mpi.sql
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/population.sql
/usr/local/bin/psql -U $POSTGRES_USER -d $POSTGRES_DB -a -f /scripts/corruption.sql

# cleanup data
rm -rf /data/boston-crime-data
rm -rf /data/mpi
rm -rf /data/population

echo "Finished loading data"
