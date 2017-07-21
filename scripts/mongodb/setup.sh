#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE mongo:3
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PORT 27017
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 "$MONGODB_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
