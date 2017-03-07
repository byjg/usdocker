#!/usr/bin/env bash

source "$USD_SCRIPTS/postgres/setup.sh"

docker exec -it postgres${CONTAINER_NAME_SUFFIX} bash

