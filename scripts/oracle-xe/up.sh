#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -v `adjustLocalDirectories ${ORACLE_XE_FOLDER} /u01/app/oracle` \
    -v `adjustLocalDirectories "$USD_HOME/${USD_SERVICE}/conf" /docker-entrypoint-initdb.d` \
    -p ${ORACLE_XE_APEX}:8080 \
    -p ${ORACLE_XE_PORT}:1521 \
    -e IMPORT_FROM_VOLUME=${ORACLE_XE_ALLOW_IMPORT} \
    -e processes=${ORACLE_XE_PROCESSES} \
    -e sessions=${ORACLE_XE_SESSIONS} \
    -e transactions=${ORACLE_XE_TRANSACTIONS} \
    -e TZ=${TZ} \
    -d ${ORACLE_XE_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
