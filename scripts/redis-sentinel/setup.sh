#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE miko2u/redis-sentinel
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 26379
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 "$REDIS_SENTINEL_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue "$1" "$2" "$3"

# Data
if [ ! -d "$USD_HOME/${USD_SERVICE}" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

