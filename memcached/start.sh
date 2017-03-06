#!/usr/bin/env bash

dockerMachineWarning

setupEnvironment memcached/environment MEMCACHED_IMAGE memcached:alpine
setupEnvironment memcached/environment MEMCACHED_FOLDER ${USD_DATA}/memcached
setupEnvironment memcached/environment MEMCACHED_PORT 11211
setupEnvironment memcached/environment MEMCACHED_MEMORY 1
source "$USD_HOME/memcached/environment"

docker run \
    --name memcached${CONTAINER_NAME_SUFFIX} \
    -p ${MEMCACHED_PORT}:11211 \
    -v `adjustLocalDirectories "${MEMCACHED_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${MEMCACHED_IMAGE} \
    memcached -m ${MEMCACHED_MEMORY}

checkIsRunning memcached${CONTAINER_NAME_SUFFIX}