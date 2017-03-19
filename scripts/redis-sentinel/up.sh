#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/redis-sentinel/setup.sh"

docker run \
    --name redis-sentinel${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${USD_HOME}/redis-sentinel/conf/redis.conf" "/etc/redis-sentinel.conf"` \
    -p ${REDIS_SENTINEL_PORT}:6379 \
    -v `adjustLocalDirectories "${REDIS_SENTINEL_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${REDIS_SENTINEL_IMAGE} \

checkIsRunning redis-sentinel${CONTAINER_NAME_SUFFIX}
