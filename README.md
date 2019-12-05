# Populated postgres

![](https://img.shields.io/docker/cloud/automated/zar3bski/populated_postgres.svg)
![](https://img.shields.io/docker/cloud/build/zar3bski/populated_postgres.svg)
![](https://images.microbadger.com/badges/image/zar3bski/populated_postgres.svg)
![](https://img.shields.io/github/v/release/zar3bski/populated_postgres)

A postrgresql database pre-populated for demo / teaching purposes.

Included datasets: 

* criminality in Boston (2015-2018) [source](https://www.kaggle.com/AnalyzeBoston/crimes-in-boston)
* world poverty [source](https://www.kaggle.com/ophi/mpi)

This image should **not be used in production**

## Usage

Like a regular postgres image, this image accept the following **ENV VAR** but can be used without supplying any. In such a case, default values will be used 

| var name            | default value    |
|--------------------:|:-----------------|
| POSTGRES_USER       | some_user        |
| POSTGRES_PASSWORD   | some_password    |
| POSTGRES_DB         | some_db          |

### run with docker

```
docker run -d -p 5432:5432 -e "POSTGRES_DB=the_name_of_db" -e "POSTGRES_PASSWORD=some_strong_password" -e "POSTGRES_USER=some_fancy_user_name" zar3bski/populated_postgres
```

### run with [docker-compose](https://docs.docker.com/compose/)

```
version: '3.7'

services:
  populated_db:
    container_name: populated_db
    image: zar3bski/populated_postgres
    ports:
      - 5432:5432
	environment:
      - POSTGRES_DB=the_name_of_db
      - POSTGRES_PASSWORD=some_strong_password
      - POSTGRES_USER=some_fancy_user_name
```
