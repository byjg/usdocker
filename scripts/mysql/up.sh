#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/mysql/setup.sh"

docker run \
    --name mysql${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${MYSQL_FOLDER}" "/var/lib/mysql"` \
    -v /tmp:/tmp \
    -v `adjustLocalDirectories "$USD_HOME/mysql/conf.d" /etc/mysql/conf.d` \
    -v `adjustLocalDirectories "$USD_HOME/mysql/home" /root` \
    -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
    -p ${MYSQL_PORT}:3306 \
    -e TZ=${TZ} \
    -d ${MYSQL_IMAGE}

checkIsRunning mysql${CONTAINER_NAME_SUFFIX}
