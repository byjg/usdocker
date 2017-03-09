#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/lemp/setup.sh"

# Build and Run LEMP
cd "$USD_HOME/lemp/"
eval $(cat $USD_HOME/lemp/environment) \
eval $(cat $USD_HOME/environment) \
docker-compose -f docker-compose.yml up -d --build

checkIsRunning lemp-fpm$CONTAINER_NAME_SUFFIX
checkIsRunning lemp-nginx$CONTAINER_NAME_SUFFIX