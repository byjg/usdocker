#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/redis/setup.sh"

docker exec -it redis${CONTAINER_NAME_SUFFIX} redis-cli
