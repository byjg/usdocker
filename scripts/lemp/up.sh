#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

if [ -z "$APPLICATION_ENV" ]; then
    APPLICATION_ENV="dev"
fi

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} `linkContainer` \
    -e "LEMP_DATA_FOLDER=${LEMP_DATA_FOLDER}" \
    -e "LEMP_PORT=${LEMP_PORT}" \
    -e "LEMP_SSL_PORT=${LEMP_SSL_PORT}" \
    -e "APPLICATION_ENV=${APPLICATION_ENV}" \
    -p "$LEMP_PORT:80" \
    -p "$LEMP_SSL_PORT:443" \
    -v `adjustLocalDirectories "$LEMP_DATA_FOLDER" /srv/web` \
    -v `adjustLocalDirectories "$USD_HOME/$USD_SERVICE/conf/fpm/fpmpool/zz-docker-2.conf" /usr/local/etc/php-fpm.d/zz-docker-2.conf` \
    -v `adjustLocalDirectories "$USD_HOME/$USD_SERVICE/conf/fpm/php/custom.ini" /usr/local/etc/php/conf.d/custom.ini` \
    -v `adjustLocalDirectories "$USD_HOME/$USD_SERVICE/conf/nginx/conf.d" /etc/nginx/conf.d/` \
    -e TZ=${TZ} \
    -d ${LEMP_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
