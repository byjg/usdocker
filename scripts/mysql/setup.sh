#!/usr/bin/env bash

# Setup Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE mysql:5.7
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 3306
setupEnvironment ${USD_SERVICE}/environment ROOT_PASSWORD password
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetData $1 "$MYSQL_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

if [ ! -d "$USD_HOME/${USD_SERVICE}" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf.d" "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/home" "$USD_HOME/${USD_SERVICE}"
fi



