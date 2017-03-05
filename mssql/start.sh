#!/bin/bash

setupEnvironment environment-mssql MSSQL_IMAGE microsoft/mssql-server-linux
setupEnvironment environment-mssql MSSQL_FOLDER /var/lib/mssql
setupEnvironment environment-mssql MSSQL_PORT 1433
source "$USD_HOME/environment-mssql"

docker run \
    --name mssql-container \
    -e 'ACCEPT_EULA=Y' \
    -e 'SA_PASSWORD=Pa$$word!' \
    -p ${MSSQL_PORT}:1433 \
    -v ${MSSQL_FOLDER}:/var/opt/mssql/data \
    -e TZ=${TZ} \
    -d ${MSSQL_IMAGE}
