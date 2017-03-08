#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/lemp/setup.sh"

# Build and Run LEMP
cd "$USD_DATA/lemp"
docker-compose up -d --build

checkIsRunning lemp-fpm-instance
checkIsRunning lemp-nginx-instance