#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${USD_HOME}/${USD_SERVICE}/conf/redis.conf" "/etc/redis-sentinel.conf"` \
    -p ${REDIS_SENTINEL_PORT}:6379 \
    -v `adjustLocalDirectories "${REDIS_SENTINEL_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${REDIS_SENTINEL_IMAGE} \

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
