#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/postgres/setup.sh"

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
