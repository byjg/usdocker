#!/usr/bin/env bash

if [ ! -d "$USD_HOME/redis" ]
then
    mkdir -p "$USD_HOME/redis"
    cp -r "$USD_SCRIPT/redis/conf" "$USD_HOME/redis"
fi

setupEnvironment redis/environment REDIS_IMAGE redis:3-alpine
setupEnvironment redis/environment REDIS_FOLDER ${USD_DATA}/redis
setupEnvironment redis/environment REDIS_PORT 6379
source "$USD_HOME/redis/environment"

