#!/usr/bin/env bash

source "$USD_SCRIPTS/mysql/setup.sh"

docker exec mysql${CONTAINER_NAME_SUFFIX} /root/mysqldump.sh $1

