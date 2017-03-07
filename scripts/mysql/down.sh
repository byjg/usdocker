#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/mysql/setup.sh"

docker stop mysql${CONTAINER_NAME_SUFFIX}
docker rm mysql${CONTAINER_NAME_SUFFIX}

