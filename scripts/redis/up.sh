#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/redis/setup.sh"

docker run \
    --name redis${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${USD_HOME}/redis/conf/redis.conf" "/etc/redis.conf"` \
    -p ${REDIS_PORT}:6379 \
    -v `adjustLocalDirectories "${REDIS_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${REDIS_IMAGE} \
    redis-server /etc/redis.conf

checkIsRunning redis${CONTAINER_NAME_SUFFIX}
