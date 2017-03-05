#!/bin/bash

setupEnvironment mongodb/environment MONGODB_IMAGE mongo:3
setupEnvironment mongodb/environment MONGODB_PORT 27017
setupEnvironment mongodb/environment MONGODB_FOLDER /var/lib/mongodb
source "$USD_HOME/mongodb/environment"

docker run \
    --name mongodb${CONTAINER_NAME_SUFFIX} \
    -v ${MONGODB_FOLDER}:/data/db \
    -v /tmp:/tmp \
    -p ${MONGODB_PORT}:27017 \
    -e TZ=America/Sao_Paulo \
    -d ${MONGODB_IMAGE}

