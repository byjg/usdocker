#!/usr/bin/env bash

# Environment
setupEnvironment lemp/environment LEMP_DATA_FOLDER \${USD_DATA}/lemp
setupEnvironment lemp/environment LEMP_PORT 80
setupEnvironment lemp/environment LEMP_SSL_PORT 443
source "$USD_HOME/lemp/environment"

# Reset question
resetQuestion $1
resetEnvironment $1
resetData $1 $LEMP_DATA_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
if [ ! -d "$LEMP_DATA_FOLDER" ]
then
    cp -r "$USD_SCRIPTS/lemp/data" "$LEMP_DATA_FOLDER"
fi

if [ ! -f "$USD_HOME/lemp/docker-compose.yml" ]
then
    cp -r $USD_SCRIPTS/lemp/docker* "$USD_HOME/lemp/"
fi
