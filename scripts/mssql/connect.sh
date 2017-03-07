#!/usr/bin/env bash

source "$USD_SCRIPTS/mssql/setup.sh"

docker exec -it mssql${CONTAINER_NAME_SUFFIX} bash

