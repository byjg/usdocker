#!/usr/bin/env bash

# Environment
setupEnvironment redis-sentinel/environment redis-sentinel_IMAGE miko2u/redis-sentinel
setupEnvironment redis-sentinel/environment redis-sentinel_FOLDER \${USD_DATA}/redis-sentinel
setupEnvironment redis-sentinel/environment redis-sentinel_PORT 26379
source "$USD_HOME/redis-sentinel/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $REDIS-SENTINEL_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
if [ ! -d "$USD_HOME/redis-sentinel" ]
then
    mkdir -p "$USD_HOME/redis-sentinel"
    cp -r "$USD_SCRIPTS/redis-sentinel/conf" "$USD_HOME/redis-sentinel"
fi

