#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/wordpress/setup.sh"

docker stop wordpress${CONTAINER_NAME_SUFFIX}
docker rm wordpress${CONTAINER_NAME_SUFFIX}

