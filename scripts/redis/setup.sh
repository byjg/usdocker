#!/usr/bin/env bash

# Environement
setupEnvironment redis/environment REDIS_IMAGE redis:3-alpine
setupEnvironment redis/environment REDIS_FOLDER \${USD_DATA}/redis
setupEnvironment redis/environment REDIS_PORT 6379
source "$USD_HOME/redis/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $REDIS_FOLDER
resetFinsih $1

# Data
if [ ! -d "$USD_HOME/redis" ]
then
    mkdir -p "$USD_HOME/redis"
    cp -r "$USD_SCRIPTS/redis/conf" "$USD_HOME/redis"
fi

