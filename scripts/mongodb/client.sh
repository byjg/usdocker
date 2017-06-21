#!/usr/bin/env bash

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker exec -it ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} mongo "$@"
