#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/postgres/setup.sh"

docker stop postgres${CONTAINER_NAME_SUFFIX}
docker rm postgres${CONTAINER_NAME_SUFFIX}
