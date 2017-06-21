#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE wordpress:4.8-php7.1
setupEnvironment ${USD_SERVICE}/environment PLUGIN_FOLDER \${USD_DATA}/\${USD_SERVICE}/plugins
setupEnvironment ${USD_SERVICE}/environment THEME_FOLDER \${USD_DATA}/\${USD_SERVICE}/themes
setupEnvironment ${USD_SERVICE}/environment UPLOAD_FOLDER \${USD_DATA}/\${USD_SERVICE}/uploads
setupEnvironment ${USD_SERVICE}/environment LANGUAGES_FOLDER \${USD_DATA}/\${USD_SERVICE}/languages
setupEnvironment ${USD_SERVICE}/environment PORT 8080
setupEnvironment ${USD_SERVICE}/environment DB_HOST mysql\${CONTAINER_NAME_SUFFIX}:3306
setupEnvironment ${USD_SERVICE}/environment DB_USER root
setupEnvironment ${USD_SERVICE}/environment DB_PASSWORD password
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 $WORDPRESS_PLUGIN_FOLDER
resetData $1 $WORDPRESS_THEME_FOLDER
resetData $1 $WORDPRESS_UPLOAD_FOLDER
resetData $1 $WORDPRESS_LANGUAGES_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
if [ ! -d "$USD_HOME/${USD_SERVICE}/conf" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}/conf"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

if [ ! -d "$WORDPRESS_UPLOAD_FOLDER" ]
then
    mkdir -p "$WORDPRESS_UPLOAD_FOLDER"
    echo
    echo "# It is necessary adjust permission as superuser."
    echo "# If the command below fails, please execute it manually before start using"
    echo
    echo "# ----------------------------------------------"
    echo "# sudo chown 33:33 \"$WORDPRESS_UPLOAD_FOLDER\""
    echo "# ----------------------------------------------"
    echo
    sudo chown 33:33 "$WORDPRESS_UPLOAD_FOLDER"
fi

if [ ! -d "$WORDPRESS_LANGUAGES_FOLDER" ]
then
    mkdir -p "$WORDPRESS_LANGUAGES_FOLDER"
fi
