#!/usr/bin/env bash

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker exec ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} /root/mysqldump.sh $1

