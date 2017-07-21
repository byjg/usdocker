#!/usr/bin/env bash

# Environement
setupEnvironment ${USD_SERVICE}/environment IMAGE redis:3-alpine
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 6379
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 "$REDIS_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
if [ ! -d "$USD_HOME/${USD_SERVICE}" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

