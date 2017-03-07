#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/mongodb/setup.sh"

docker stop mongodb${CONTAINER_NAME_SUFFIX}
docker rm mongodb${CONTAINER_NAME_SUFFIX}
