FROM postgres:11.4-alpine
MAINTAINER zarebski

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD boston_password
ENV POSTGRES_DB crime_boston

COPY ./entrypoint.sh /usr/local/bin/docker-entrypoint.sh
COPY ./init.sql /home/$POSTGRES_USER/init.sql
COPY ./boston-crime-data.zip /home/$POSTGRES_USER/boston-crime-data.zip

EXPOSE 5432

RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]