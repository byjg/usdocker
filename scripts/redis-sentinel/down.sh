#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/redis-sentinel/setup.sh"

docker stop redis-sentinel${CONTAINER_NAME_SUFFIX}
docker rm redis-sentinel${CONTAINER_NAME_SUFFIX}
