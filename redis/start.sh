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

echo docker run \
    --name redis${CONTAINER_NAME_SUFFIX} \
    -v ${USD_HOME}/redis/conf/redis.conf:/usr/local/etc/redis/redis.conf \
    -p ${REDIS_PORT}:6379 \
    -v ${REDIS_FOLDER}:/data \
    -d ${REDIS_IMAGE} \
    -e TZ=${TZ} \
    redis-server /usr/local/etc/redis/redis.conf
