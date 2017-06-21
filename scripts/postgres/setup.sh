#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE postgres:9-alpine
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/\${USD_SERVICE}ql
setupEnvironment ${USD_SERVICE}/environment USER ${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PASSWORD password
setupEnvironment ${USD_SERVICE}/environment PORT 5432
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 "$POSTGRES_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
