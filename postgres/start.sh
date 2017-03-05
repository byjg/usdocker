#!/bin/bash

setupEnvironment environment-postgres POSTGRES_IMAGE postgres:9-alpine
setupEnvironment environment-postgres POSTGRES_FOLDER /var/lib/postgresql/data
setupEnvironment environment-postgres POSTGRES_USER postgres
setupEnvironment environment-postgres POSTGRES_PORT 5432
source "$USD_HOME/environment-postgres"

docker run \
    --name postgres-container \
    -v ${POSTGRES_FOLDER}:/var/lib/postgresql/data \
    -v /tmp:/tmp \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${DEFAULT_PASSWORD} \
    -p ${POSTGRES_PORT}:5432 \
    -e TZ=${TZ} \
    -d ${POSTGRES_IMAGE}

