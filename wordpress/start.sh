#!/usr/bin/env bash

if [ ! -d "$USD_HOME/wordpress" ]
then
    mkdir -p "$USD_HOME/wordpress"
    cp -r "$USD_DIR/wordpress/conf" "$USD_HOME/wordpress"
fi

setupEnvironment environment-wordpress WORDPRESS_IMAGE wordpress
#setupEnvironment environment-wordpress WORDPRESS_PLUGIN_FOLDER /var/lib/wordpress
#setupEnvironment environment-wordpress WORDPRESS_THEME_FOLDER /var/lib/wordpress
setupEnvironment environment-wordpress WORDPRESS_PORT 8080
setupEnvironment environment-wordpress WORDPRESS_DB_HOST mysql-container:3306
setupEnvironment environment-wordpress WORDPRESS_DB_USER root
setupEnvironment environment-wordpress WORDPRESS_DB_PASSWORD password
source "$USD_HOME/environment-wordpress"

docker run  \
    --name wordpress-container `linkContainer` \
    -e WORDPRESS_DB_HOST=${WORDPRESS_DB_HOST} \
    -e WORDPRESS_DB_USER=${WORDPRESS_DB_USER} \
    -e WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD} \
    -v "${USD_HOME}/wordpress/conf/uploads.ini":/usr/local/etc/php/conf.d/uploads.ini \
    -p ${WORDPRESS_PORT}:80 \
    -e TZ=${TZ} \
    -d ${WORDPRESS_IMAGE}


#-v ${WORDPRESS_PLUGIN_FOLDER}:/var/www/html/wp-content/plugins \
#-v ${WORDPRESS_THEME_FOLDER}:/var/www/html/wp-content/themes \
