#!/usr/bin/env bash

if [ ! -d "$USD_HOME/mysql" ]
then
    mkdir -p "$USD_HOME/mysql"
    cp -r "$USD_SCRIPTS/mysql/conf.d" "$USD_HOME/mysql"
    cp -r "$USD_SCRIPTS/mysql/home" "$USD_HOME/mysql"
fi

setupEnvironment mysql/environment MYSQL_IMAGE mysql:5.7
setupEnvironment mysql/environment MYSQL_FOLDER \${USD_DATA}/mysql
setupEnvironment mysql/environment MYSQL_PORT 3306
setupEnvironment mysql/environment MYSQL_ROOT_PASSWORD password
source "$USD_HOME/mysql/environment"

resetQuestion $1
resetEnvironment $1
resetData $1 $MYSQL_FOLDER
resetFinsih $1


