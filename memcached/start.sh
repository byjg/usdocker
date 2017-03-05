#!/bin/bash

setupEnvironment environment-memcached MEMCACHED_IMAGE memcached:alpine
setupEnvironment environment-memcached MEMCACHED_FOLDER /var/lib/memcached
setupEnvironment environment-memcached MEMCACHED_PORT 11211
setupEnvironment environment-memcached MEMCACHED_MEMORY 1
source "$USD_HOME/environment-memcached"

docker run \
    --name memcached-container \
    -p ${MEMCACHED_PORT}:11211 \
    -v "${MEMCACHED_FOLDER}":/data \
    -d ${MEMCACHED_IMAGE} \
    -e TZ=${TZ} \
    memcached -m ${MEMCACHED_MEMORY}
