#!/usr/bin/env bash

if [ ! -d "$USD_HOME/wordpress" ]
then
    mkdir -p "$USD_HOME/wordpress"
    cp -r "$USD_SCRIPTS/wordpress/conf" "$USD_HOME/wordpress"
fi

setupEnvironment wordpress/environment WORDPRESS_IMAGE wordpress
#setupEnvironment wordpress/environment WORDPRESS_PLUGIN_FOLDER /var/lib/wordpress
#setupEnvironment wordpress/environment WORDPRESS_THEME_FOLDER /var/lib/wordpress
setupEnvironment wordpress/environment WORDPRESS_PORT 8080
setupEnvironment wordpress/environment WORDPRESS_DB_HOST mysql${CONTAINER_NAME_SUFFIX}:3306
setupEnvironment wordpress/environment WORDPRESS_DB_USER root
setupEnvironment wordpress/environment WORDPRESS_DB_PASSWORD password
source "$USD_HOME/wordpress/environment"

