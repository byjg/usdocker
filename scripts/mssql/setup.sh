#!/usr/bin/env bash

# Environment
setupEnvironment mssql/environment MSSQL_IMAGE microsoft/mssql-server-linux
setupEnvironment mssql/environment MSSQL_FOLDER \${USD_DATA}/mssql
setupEnvironment mssql/environment MSSQL_PORT 1433
source "$USD_HOME/mssql/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $MSSQL_FOLDER
resetFinsih $1

#Data
