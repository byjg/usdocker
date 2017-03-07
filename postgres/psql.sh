#!/usr/bin/env bash

source "$USD_DIR/postgres/setup.sh"

docker exec -it postgres${CONTAINER_NAME_SUFFIX} psql "$@"

