#!/usr/bin/env bash

# Environment
setupEnvironment postgres/environment POSTGRES_IMAGE postgres:9-alpine
setupEnvironment postgres/environment POSTGRES_FOLDER \${USD_DATA}/postgresql
setupEnvironment postgres/environment POSTGRES_USER postgres
setupEnvironment postgres/environment POSTGRES_PASSWORD password
setupEnvironment postgres/environment POSTGRES_PORT 5432
source "$USD_HOME/postgres/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $POSTGRES_FOLDER
resetFinsih $1

# Data