#!/usr/bin/env bash

if [ -z "$1"  ]
then
    find "${USD_SCRIPTS}/." -maxdepth 1  ! -name '.*' -type d -exec basename "{}" \; | sort
else
    find "${USD_SCRIPTS}/$1" -maxdepth 1  -name '*.sh' -type f -exec basename "{}" \; | cut -d'.' -f1 | sort
fi


