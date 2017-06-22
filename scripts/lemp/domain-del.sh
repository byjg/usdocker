#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

if [ -z "$1" ]; then
    echo "You have to provide the domain name. The domains available are: "
    find "$LEMP_DATA_FOLDER/." -maxdepth 1  ! -name '.*' -type d -exec basename "{}" \; | sort | sed -e 's/^/ - /'
    echo
    exit 1
fi

if [ ! -d "$LEMP_DATA_FOLDER/$1" ]; then
    echo "The domain does not exists"
    echo
    exit 1
fi

echo "Do you really want unregister and REMOVE ALL CONTENTS from $1?"
echo "THIS OPERATION CANNOT BE UNDONE"
echo "Press ENTER to continue or CTRL+C for abort"
read
echo "Press ENTER again to confirm or CTRL+C for abort"
read

rm -rf "/tmp/$1"
mv "$LEMP_DATA_FOLDER/$1" "/tmp/$1"

echo The domain was removed and a backup was created at "/tmp/$1"
echo
