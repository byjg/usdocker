#!/usr/bin/env bash

setupEnvironment mongodb/environment MONGODB_IMAGE mongo:3
setupEnvironment mongodb/environment MONGODB_PORT 27017
setupEnvironment mongodb/environment MONGODB_FOLDER ${USD_DATA}/mongodb
source "$USD_HOME/mongodb/environment"
