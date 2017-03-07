#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

SCRIPT_LIST="composer php7 php56 phpcs phpmd phpunit phpunit56"

for SCRIPT in ${SCRIPT_LIST}
do
    rm /usr/local/bin/${SCRIPT}
done;
