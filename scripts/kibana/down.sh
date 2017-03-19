#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/kibana/setup.sh"

docker stop kibana${CONTAINER_NAME_SUFFIX}
docker rm kibana${CONTAINER_NAME_SUFFIX}

