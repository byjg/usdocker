#!/usr/bin/env bash

setupEnvironment mssql/environment MSSQL_IMAGE microsoft/mssql-server-linux
setupEnvironment mssql/environment MSSQL_FOLDER ${USD_DATA}/mssql
setupEnvironment mssql/environment MSSQL_PORT 1433
source "$USD_HOME/mssql/environment"
