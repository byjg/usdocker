#!/usr/bin/env bash

source "$USD_DIR/mongodb/setup.sh"

docker exec -it mongodb${CONTAINER_NAME_SUFFIX} mongo "$@"
