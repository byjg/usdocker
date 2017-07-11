#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

if [ -z "$1" ]; then
    echo "You have to provide the domain name. e.g. example.com or 192.168.1.230"
    echo
    exit 1
fi

if [ -d "$LEMP_DATA_FOLDER/$1" ]; then
    echo "The domain already exists"
    echo
    exit 1
fi

if [ ! -z "$2" ]; then
    if [ -f "$2" ]; then
        echo "Using '$2' as template"
        mkdir -p "$LEMP_DATA_FOLDER/$1/"
        tar xvf "$2" -C "$LEMP_DATA_FOLDER/$1/"
    else
        echo "Error file does not exists!"
    fi
else
    TEMPLATE="$USD_SCRIPTS/${USD_SERVICE}/data/.template"
    if [ -d "$LEMP_DATA_FOLDER/.template" ]; then
        TEMPLATE="$LEMP_DATA_FOLDER/.template"
    fi

    cp -r "$TEMPLATE"  "$LEMP_DATA_FOLDER/$1/"
fi

