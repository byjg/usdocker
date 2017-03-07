#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/mongodb/setup.sh"

docker run \
    --name mongodb${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${MONGODB_FOLDER}" "/data/db"` \
    -v /tmp:/tmp \
    -p ${MONGODB_PORT}:27017 \
    -e TZ=America/Sao_Paulo \
    -d ${MONGODB_IMAGE}

checkIsRunning mongodb${CONTAINER_NAME_SUFFIX}
