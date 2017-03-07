#!/usr/bin/env bash

source "$USD_DIR/mssql/setup.sh"

docker exec -it mssql${CONTAINER_NAME_SUFFIX} bash

