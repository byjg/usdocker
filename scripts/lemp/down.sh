#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/lemp/setup.sh"

cd "$USD_HOME/lemp"

eval $(cat $USD_HOME/lemp/environment) \
eval $(cat $USD_HOME/environment) \
docker-compose -f docker-compose.yml down

docker rmi lemp-fpm
docker rmi lemp-nginx
