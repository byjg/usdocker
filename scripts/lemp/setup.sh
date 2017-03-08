#!/usr/bin/env bash

# Environment
setupEnvironment lemp/environment LEMP_DATA_FOLDER "\$HOME/usdocker-lemp"
setupEnvironment lemp/environment LEMP_PORT 80
source "$USD_HOME/lemp/environment"

# Reset question
resetQuestion $1
resetEnvironment $1
resetData $1 $LEMP_DATA_FOLDER
resetFinsih $1

# Data
if [ ! -d "$LEMP_DATA_FOLDER" ]
then
    cp -r "$USD_SCRIPTS/lemp/data" "$LEMP_DATA_FOLDER"
fi

if [ ! -d "$USD_DATA/lemp" ]
then
    mkdir -p "$USD_DATA/lemp"
    cp -r $USD_SCRIPTS/lemp/docker* "$USD_DATA/lemp/"
fi
