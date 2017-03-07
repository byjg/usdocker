#!/usr/bin/env bash

dockerMachineWarning

source "$USD_DIR/wordpress/setup.sh"

docker stop wordpress${CONTAINER_NAME_SUFFIX}
docker rm wordpress${CONTAINER_NAME_SUFFIX}

