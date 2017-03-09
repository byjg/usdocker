#!/usr/bin/env bash

if [ ! -f "$USD_HOME/$1/environment" ]; then
    source $USD_SCRIPTS/$1/setup.sh
fi

cat $USD_HOME/$1/environment | cut -d= -f1