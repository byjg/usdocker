#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/memcached/setup.sh"

docker run \
    --name memcached${CONTAINER_NAME_SUFFIX} \
    -p ${MEMCACHED_PORT}:11211 \
    -v `adjustLocalDirectories "${MEMCACHED_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${MEMCACHED_IMAGE} \
    memcached -m ${MEMCACHED_MEMORY}

checkIsRunning memcached${CONTAINER_NAME_SUFFIX}