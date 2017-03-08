#!/usr/bin/env bash

setupEnvironment lemp/environment LEMP_DATA_FOLDER "$HOME/usdocker-lemp"
setupEnvironment lemp/environment LEMP_PORT 80
source "$USD_HOME/lemp/environment"

if [ "$1" == "--reset" ]
then
    echo "Do you really reset all user data? Press ENTER to continue or CTRL+C to cancel"
    read

    rm -rf $LEMP_DATA_FOLDER
    rm -rf $USD_DATA/lemp

    echo "Done."
fi

if [ ! -d "$LEMP_DATA_FOLDER" ]
then
    cp -r "$USD_SCRIPTS/lemp/data" "$LEMP_DATA_FOLDER"
fi

if [ ! -d "$USD_DATA/lemp" ]
then
    mkdir -p "$USD_DATA/lemp"
    cp -r $USD_SCRIPTS/lemp/docker* "$USD_DATA/lemp/"
fi
