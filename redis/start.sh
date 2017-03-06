#!/usr/bin/env bash

if [ ! -d "$USD_HOME/redis" ]
then
    mkdir -p "$USD_HOME/redis"
    cp -r "$USD_DIR/redis/conf" "$USD_HOME/redis"
fi

setupEnvironment redis/environment REDIS_IMAGE redis:3-alpine
setupEnvironment redis/environment REDIS_FOLDER ${USD_DATA}/redis
setupEnvironment redis/environment REDIS_PORT 6379
source "$USD_HOME/redis/environment"

docker run \
    --name redis${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${USD_HOME}/redis/conf/redis.conf" "/etc/redis.conf"` \
    -p ${REDIS_PORT}:6379 \
    -v `adjustLocalDirectories "${REDIS_FOLDER}" "/data"` \
    -e TZ=${TZ} \
    -d ${REDIS_IMAGE} \
    redis-server /etc/redis.conf

checkIsRunning redis${CONTAINER_NAME_SUFFIX}
