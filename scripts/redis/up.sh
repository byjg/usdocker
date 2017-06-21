#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${USD_HOME}/redis/conf/redis.conf" "/etc/redis.conf"` \
    -p ${REDIS_PORT}:6379 \
    -v `adjustLocalDirectories "${REDIS_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${REDIS_IMAGE} \
    redis-server /etc/redis.conf

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
