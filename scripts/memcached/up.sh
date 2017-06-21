#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -p ${MEMCACHED_PORT}:11211 \
    -v `adjustLocalDirectories "${MEMCACHED_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${MEMCACHED_IMAGE} \
    memcached -m ${MEMCACHED_MEMORY}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}