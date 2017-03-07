#!/usr/bin/env bash

setupEnvironment postgres/environment POSTGRES_IMAGE postgres:9-alpine
setupEnvironment postgres/environment POSTGRES_FOLDER ${USD_DATA}/postgresql
setupEnvironment postgres/environment POSTGRES_USER postgres
setupEnvironment postgres/environment POSTGRES_PASSWORD password
setupEnvironment postgres/environment POSTGRES_PORT 5432
source "$USD_HOME/postgres/environment"
