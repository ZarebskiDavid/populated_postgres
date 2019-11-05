FROM postgres:11.4-alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD boston_password
ENV POSTGRES_DB crime_boston

COPY ./entrypoint.sh /data/entrypoint.sh
COPY ./init.sql /data/init.sql
COPY ./boston-crime-data.zip /data/boston-crime-data.zip

EXPOSE 5432

# TODO EXECUTE ORIGINAL ENTRYPOINT/usr/local/bin/docker-entrypoint.sh and load data????

RUN chmod +x /data/entrypoint.sh
ENTRYPOINT ["/data/entrypoint.sh"] 

CMD tail -f /dev/null