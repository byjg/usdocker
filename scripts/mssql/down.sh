#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/mssql/setup.sh"

docker stop mssql${CONTAINER_NAME_SUFFIX}
docker rm mssql${CONTAINER_NAME_SUFFIX}
