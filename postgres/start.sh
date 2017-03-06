#!/usr/bin/env bash

setupEnvironment postgres/environment POSTGRES_IMAGE postgres:9-alpine
setupEnvironment postgres/environment POSTGRES_FOLDER ${USD_DATA}/postgresql
setupEnvironment postgres/environment POSTGRES_USER postgres
setupEnvironment postgres/environment POSTGRES_PASSWORD password
setupEnvironment postgres/environment POSTGRES_PORT 5432
source "$USD_HOME/postgres/environment"

docker run \
    --name postgres${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories ${POSTGRES_FOLDER} /var/lib/postgresql/data` \
    -v /tmp:/tmp \
    -e POSTGRES_USER=${POSTGRES_USER} \
    -e POSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
    -p ${POSTGRES_PORT}:5432 \
    -e TZ=${TZ} \
    -d ${POSTGRES_IMAGE}

checkIsRunning postgres${CONTAINER_NAME_SUFFIX}
