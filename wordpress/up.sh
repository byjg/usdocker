#!/usr/bin/env bash

dockerMachineWarning

if [ ! -d "$USD_HOME/wordpress" ]
then
    mkdir -p "$USD_HOME/wordpress"
    cp -r "$USD_DIR/wordpress/conf" "$USD_HOME/wordpress"
fi

setupEnvironment wordpress/environment WORDPRESS_IMAGE wordpress
#setupEnvironment wordpress/environment WORDPRESS_PLUGIN_FOLDER /var/lib/wordpress
#setupEnvironment wordpress/environment WORDPRESS_THEME_FOLDER /var/lib/wordpress
setupEnvironment wordpress/environment WORDPRESS_PORT 8080
setupEnvironment wordpress/environment WORDPRESS_DB_HOST mysql${CONTAINER_NAME_SUFFIX}:3306
setupEnvironment wordpress/environment WORDPRESS_DB_USER root
setupEnvironment wordpress/environment WORDPRESS_DB_PASSWORD password
source "$USD_HOME/wordpress/environment"

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
