#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=Pa$$word!' \
    -p ${MSSQL_PORT}:1433 \
    -v `adjustLocalDirectories "${MSSQL_FOLDER}" "/var/opt/mssql/data"` \
    -e TZ=${TZ} \
    -d ${MSSQL_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}