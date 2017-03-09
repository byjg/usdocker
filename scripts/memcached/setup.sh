#!/usr/bin/env bash

# Environment
setupEnvironment memcached/environment MEMCACHED_IMAGE memcached:alpine
setupEnvironment memcached/environment MEMCACHED_FOLDER \${USD_DATA}/memcached
setupEnvironment memcached/environment MEMCACHED_PORT 11211
setupEnvironment memcached/environment MEMCACHED_MEMORY 1
source "$USD_HOME/memcached/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $MEMCACHED_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
