#!/bin/bash

setupEnvironment environment-mongodb MONGODB_IMAGE mongo:3
setupEnvironment environment-mongodb MONGODB_PORT 27017
setupEnvironment environment-mongodb MONGODB_FOLDER /var/lib/mongodb
source "$USD_HOME/environment-mongodb"

docker run \
    --name mongodb-container \
    -v ${MONGODB_FOLDER}:/data/db \
    -v /tmp:/tmp \
    -p ${MONGODB_PORT}:27017 \
    -e TZ=America/Sao_Paulo \
    -d ${MONGODB_IMAGE}

