FROM postgres:11.4-alpine

ENV POSTGRES_USER some_user
ENV POSTGRES_PASSWORD some_password
ENV POSTGRES_DB some_db

COPY ./db_init.sh /docker-entrypoint-initdb.d/db_init.sh
COPY ./scripts /scripts
COPY ./data /data

RUN chmod -R 777 /data

RUN chmod +x /docker-entrypoint-initdb.d/db_init.sh

