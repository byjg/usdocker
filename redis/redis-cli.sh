#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/redis/setup.sh"

docker exec -it redis${CONTAINER_NAME_SUFFIX} redis-cli
