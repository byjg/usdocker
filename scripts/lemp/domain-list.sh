#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

for LIST in `find "$LEMP_DATA_FOLDER/" -maxdepth 1 -type d`; do
    basename "$LIST"
done
