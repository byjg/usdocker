#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories "${MYSQL_FOLDER}" "/var/lib/mysql"` \
    -v /tmp:/tmp \
    -v `adjustLocalDirectories "$USD_HOME/${USD_SERVICE}/conf.d" /etc/mysql/conf.d` \
    -v `adjustLocalDirectories "$USD_HOME/${USD_SERVICE}/home" /root` \
    -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
    -p ${MYSQL_PORT}:3306 \
    -e TZ=${TZ} \
    -d ${MYSQL_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
