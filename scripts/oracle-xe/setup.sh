#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE sath89/oracle-xe-11g
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/\${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 1521
setupEnvironment ${USD_SERVICE}/environment APEX 8080
setupEnvironment ${USD_SERVICE}/environment PROCESSES 500
setupEnvironment ${USD_SERVICE}/environment SESSIONS 555
setupEnvironment ${USD_SERVICE}/environment TRANSACTIONS 610
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 "$ORACLE_XE_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
