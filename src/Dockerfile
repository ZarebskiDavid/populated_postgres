FROM postgres:11.4-alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD boston_password
ENV POSTGRES_DB crime_boston

COPY ./entrypoint.sh /docker-entrypoint-initdb.d/entrypoint.sh
COPY ./init.sql /docker-entrypoint-initdb.d/init.sql
COPY ./boston-crime-data.zip /docker-entrypoint-initdb.d/boston-crime-data.zip

RUN chmod +x /docker-entrypoint-initdb.d/entrypoint.sh
