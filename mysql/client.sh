#!/usr/bin/env bash

source "$USD_DIR/mysql/setup.sh"

docker exec -it mysql${CONTAINER_NAME_SUFFIX} mysql "$@"

