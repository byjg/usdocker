#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/redis/setup.sh"

docker stop redis${CONTAINER_NAME_SUFFIX}
docker rm redis${CONTAINER_NAME_SUFFIX}