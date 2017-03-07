#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/wordpress/setup.sh"

docker run  \
    --name wordpress${CONTAINER_NAME_SUFFIX} `linkContainer` \
    -e WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST} \
    -e WORDPRESS_DB_USER=${WORDPRESS_DB_USER} \
    -e WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD} \
    -v `adjustLocalDirectories "${USD_HOME}/wordpress/conf/uploads.ini" /usr/local/etc/php/conf.d/uploads.ini` \
    -p ${WORDPRESS_PORT}:80 \
    -e TZ=${TZ} \
    -d ${WORDPRESS_IMAGE}


#-v ${WORDPRESS_PLUGIN_FOLDER}:/var/www/html/wp-content/plugins \
#-v ${WORDPRESS_THEME_FOLDER}:/var/www/html/wp-content/themes \

checkIsRunning wordpress${CONTAINER_NAME_SUFFIX}
