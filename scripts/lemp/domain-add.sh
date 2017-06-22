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

TEMPLATE="$USD_SCRIPTS/${USD_SERVICE}/data/.template"
if [ -d "$LEMP_DATA_FOLDER/.template" ]; then
    TEMPLATE="$LEMP_DATA_FOLDER/.template"
fi

cp -r "$TEMPLATE"  "$LEMP_DATA_FOLDER/$1/"
