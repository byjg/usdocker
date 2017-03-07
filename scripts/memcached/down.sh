#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/memcached/setup.sh"

docker stop memcached${CONTAINER_NAME_SUFFIX}
docker rm memcached${CONTAINER_NAME_SUFFIX}