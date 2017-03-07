#!/usr/bin/env bash

source "$USD_SCRIPTS/mongodb/setup.sh"

docker exec -it mongodb${CONTAINER_NAME_SUFFIX} mongo "$@"
