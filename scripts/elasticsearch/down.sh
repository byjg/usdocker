#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/elasticsearch/setup.sh"

docker stop elasticsearch${CONTAINER_NAME_SUFFIX}
docker rm elasticsearch${CONTAINER_NAME_SUFFIX}

