#!/usr/bin/env bash

setupEnvironment memcached/environment MEMCACHED_IMAGE memcached:alpine
setupEnvironment memcached/environment MEMCACHED_FOLDER ${USD_DATA}/memcached
setupEnvironment memcached/environment MEMCACHED_PORT 11211
setupEnvironment memcached/environment MEMCACHED_MEMORY 1
source "$USD_HOME/memcached/environment"

