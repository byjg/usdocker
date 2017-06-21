#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE byjg/php7-fpm-nginx:alpine
setupEnvironment ${USD_SERVICE}/environment DATA_FOLDER \${USD_DATA}/\${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 80
setupEnvironment ${USD_SERVICE}/environment SSL_PORT 443
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
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/data" "$LEMP_DATA_FOLDER"
fi

if [ ! -d "$USD_HOME/${USD_SERVICE}/conf" ]
then
    cp -r $USD_SCRIPTS/${USD_SERVICE}/conf* "$USD_HOME/${USD_SERVICE}/"
fi
