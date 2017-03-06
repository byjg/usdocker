#!/usr/bin/env bash

setupEnvironment memcached/environment MEMCACHED_IMAGE memcached:alpine
setupEnvironment memcached/environment MEMCACHED_FOLDER /var/lib/memcached
setupEnvironment memcached/environment MEMCACHED_PORT 11211
setupEnvironment memcached/environment MEMCACHED_MEMORY 1
source "$USD_HOME/memcached/environment"

docker run \
    --name memcached${CONTAINER_NAME_SUFFIX} \
    -p ${MEMCACHED_PORT}:11211 \
    -v "${MEMCACHED_FOLDER}":/data \
    -d ${MEMCACHED_IMAGE} \
    -e TZ=${TZ} \
    memcached -m ${MEMCACHED_MEMORY}
