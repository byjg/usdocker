#!/usr/bin/env bash

dockerMachineWarning

cd "$USD_SCRIPTS/lemp"

docker-compose down
docker rmi lemp-fpm
docker rmi lemp-nginx
