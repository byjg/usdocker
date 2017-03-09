#!/usr/bin/env bash

# Environment
setupEnvironment wordpress/environment WORDPRESS_IMAGE wordpress:4.7-php7.1
setupEnvironment wordpress/environment WORDPRESS_PLUGIN_FOLDER \${USD_DATA}/wordpress/plugins
setupEnvironment wordpress/environment WORDPRESS_THEME_FOLDER \${USD_DATA}/wordpress/themes
setupEnvironment wordpress/environment WORDPRESS_UPLOAD_FOLDER \${USD_DATA}/wordpress/uploads
setupEnvironment wordpress/environment WORDPRESS_PORT 8080
setupEnvironment wordpress/environment WORDPRESS_DB_HOST mysql\${CONTAINER_NAME_SUFFIX}:3306
setupEnvironment wordpress/environment WORDPRESS_DB_USER root
setupEnvironment wordpress/environment WORDPRESS_DB_PASSWORD password
source "$USD_HOME/wordpress/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $WORDPRESS_PLUGIN_FOLDER
resetData $1 $WORDPRESS_THEME_FOLDER
resetData $1 $WORDPRESS_UPLOAD_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
if [ ! -d "$USD_HOME/wordpress/conf" ]
then
    mkdir -p "$USD_HOME/wordpress/conf"
    cp -r "$USD_SCRIPTS/wordpress/conf" "$USD_HOME/wordpress"
fi

if [ ! -d "$WORDPRESS_UPLOAD_FOLDER" ]
then
    mkdir -p "$WORDPRESS_UPLOAD_FOLDER"
    echo
    echo "It is necessary adjust permission as superuser."
    echo "If the command below fails, please execute it manually before start using"
    echo
    echo "----------------------------------------------"
    echo "sudo chown 33:33 \"$WORDPRESS_UPLOAD_FOLDER\""
    echo "----------------------------------------------"
    echo
    sudo chown 33:33 "$WORDPRESS_UPLOAD_FOLDER"
fi
