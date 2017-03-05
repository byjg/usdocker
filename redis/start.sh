#!/bin/bash

if [ ! -d "$USD_HOME/redis" ]
then
    mkdir -p "$USD_HOME/redis"
    cp -r "$USD_DIR/redis/conf" "$USD_HOME/redis"
fi

setupEnvironment environment-redis REDIS_IMAGE redis:3-alpine
setupEnvironment environment-redis REDIS_FOLDER /var/lib/redis
setupEnvironment environment-redis REDIS_PORT 6379
source "$USD_HOME/environment-redis"

docker run \
    --name redis${CONTAINER_NAME_SUFFIX} \
    -v ${USD_HOME}/redis/conf/redis.conf:/etc/redis.conf \
    -p ${REDIS_PORT}:6379 \
    -v ${REDIS_FOLDER}:/data \
    -e TZ=${TZ} \
    -d ${REDIS_IMAGE} \
    redis-server /etc/redis.conf
