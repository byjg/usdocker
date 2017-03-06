#!/usr/bin/env bash

if [ ! -d "$USD_HOME/mysql" ]
then
    mkdir -p "$USD_HOME/mysql"
    cp -r "$USD_DIR/mysql/conf.d" "$USD_HOME/mysql"
    cp -r "$USD_DIR/mysql/home" "$USD_HOME/mysql"
fi

setupEnvironment mysql/environment MYSQL_IMAGE mysql:5.7
setupEnvironment mysql/environment MYSQL_FOLDER /var/lib/mysql
setupEnvironment mysql/environment MYSQL_PORT 3306
setupEnvironment mysql/environment MYSQL_ROOT_PASSWORD password
source "$USD_HOME/mysql/environment"


docker run \
    --name mysql${CONTAINER_NAME_SUFFIX} \
    -v ${MYSQL_FOLDER}:/var/lib/mysql \
    -v /tmp:/tmp \
    -v "$USD_HOME/mysql/conf.d":/etc/mysql/conf.d \
    -v "$USD_HOME/mysql/home":/root \
    -e MYSQL_ROOT_PASSWORD="${MYSQL_ROOT_PASSWORD}" \
    -p ${MYSQL_PORT}:3306 \
    -e TZ=${TZ} \
    -d ${MYSQL_IMAGE}

