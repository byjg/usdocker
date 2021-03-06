#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE wordpress:4.8-php7.1
setupEnvironment ${USD_SERVICE}/environment DATAFOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment PLUGIN_FOLDER \${WORDPRESS_DATAFOLDER}/plugins
setupEnvironment ${USD_SERVICE}/environment THEME_FOLDER \${WORDPRESS_DATAFOLDER}/themes
setupEnvironment ${USD_SERVICE}/environment UPLOAD_FOLDER \${WORDPRESS_DATAFOLDER}/uploads
setupEnvironment ${USD_SERVICE}/environment LANGUAGES_FOLDER \${WORDPRESS_DATAFOLDER}/languages
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
setKeyValue "$1" "$2" "$3"

# Data
if [ ! -d "$USD_HOME/${USD_SERVICE}/conf" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}/conf"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

if [ ! -d "$WORDPRESS_DATAFOLDER" ]
then
    sudo mkdir -p "$WORDPRESS_DATAFOLDER"
    sudo chown 33:33 -R "$WORDPRESS_DATAFOLDER"
fi

if [ ! -d "$WORDPRESS_PLUGIN_FOLDER" ]
then
    sudo mkdir -p "$WORDPRESS_PLUGIN_FOLDER"
    sudo chown 33:33 -R "$WORDPRESS_PLUGIN_FOLDER"
fi

if [ ! -d "$WORDPRESS_THEME_FOLDER" ]
then
    sudo mkdir -p "$WORDPRESS_THEME_FOLDER"
    sudo chown 33:33 -R "$WORDPRESS_THEME_FOLDER"
fi

if [ ! -d "$WORDPRESS_UPLOAD_FOLDER" ]
then
    sudo mkdir -p "$WORDPRESS_UPLOAD_FOLDER"
    sudo chown 33:33 -R "$WORDPRESS_UPLOAD_FOLDER"
fi

if [ ! -d "$WORDPRESS_LANGUAGES_FOLDER" ]
then
    sudo mkdir -p "$WORDPRESS_LANGUAGES_FOLDER"
    sudo chown 33:33 -R "$WORDPRESS_LANGUAGES_FOLDER"
fi

if [ ! -d "$WORDPRESS_PLUGIN_FOLDER" ] || [ ! -d "$WORDPRESS_PLUGIN_FOLDER" ] || [ ! -d "$WORDPRESS_PLUGIN_FOLDER" ] || [ ! -d "$WORDPRESS_PLUGIN_FOLDER" ]; then
    echo
    echo "We cannot create the WORDPRESS DATA FOLDER. Please enable SUDO and continue.".
    exit
fi
