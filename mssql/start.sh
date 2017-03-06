#!/usr/bin/env bash

setupEnvironment mssql/environment MSSQL_IMAGE microsoft/mssql-server-linux
setupEnvironment mssql/environment MSSQL_FOLDER ${USD_DATA}/mssql
setupEnvironment mssql/environment MSSQL_PORT 1433
source "$USD_HOME/mssql/environment"

docker run \
    --name mssql${CONTAINER_NAME_SUFFIX} \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=Pa$$word!' \
    -p ${MSSQL_PORT}:1433 \
    -v `adjustLocalDirectories "${MSSQL_FOLDER}" "/var/opt/mssql/data"` \
    -e TZ=${TZ} \
    -d ${MSSQL_IMAGE}

checkIsRunning mssql${CONTAINER_NAME_SUFFIX}