#!/bin/bash

docker exec mysql${CONTAINER_NAME_SUFFIX} /root/mysqldump.sh $1

