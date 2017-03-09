#!/usr/bin/env bash

# Environment
setupEnvironment mongodb/environment MONGODB_IMAGE mongo:3
setupEnvironment mongodb/environment MONGODB_PORT 27017
setupEnvironment mongodb/environment MONGODB_FOLDER \${USD_DATA}/mongodb
source "$USD_HOME/mongodb/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $MONGODB_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
