#!/usr/bin/env bash

source "$USD_DIR/mysql/setup.sh"

docker exec mysql${CONTAINER_NAME_SUFFIX} /root/mysqldump.sh $1

