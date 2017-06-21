#!/usr/bin/env bash

dockerMachineWarning

checkDependency mysql

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run  \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} `linkContainer` \
    -e WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST} \
    -e WORDPRESS_DB_USER=${WORDPRESS_DB_USER} \
    -e WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD} \
    -v `adjustLocalDirectories "$WORDPRESS_PLUGIN_FOLDER" /var/www/html/wp-content/plugins` \
    -v `adjustLocalDirectories "$WORDPRESS_THEME_FOLDER" /var/www/html/wp-content/themes` \
    -v `adjustLocalDirectories "$WORDPRESS_UPLOAD_FOLDER" /var/www/html/wp-content/uploads` \
    -v `adjustLocalDirectories "$WORDPRESS_LANGUAGES_FOLDER" /var/www/html/wp-content/languages` \
    -v `adjustLocalDirectories "${USD_HOME}/${USD_SERVICE}/conf/uploads.ini" /usr/local/etc/php/conf.d/uploads.ini` \
    -p ${WORDPRESS_PORT}:80 \
    -e TZ=${TZ} \
    -d ${WORDPRESS_IMAGE}


#-v ${WORDPRESS_PLUGIN_FOLDER}:/var/www/html/wp-content/plugins \
#-v ${WORDPRESS_THEME_FOLDER}:/var/www/html/wp-content/themes \

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
