#!/usr/bin/env bash

source "$USD_SCRIPTS/mysql/setup.sh"

docker exec -it mysql${CONTAINER_NAME_SUFFIX} bash

