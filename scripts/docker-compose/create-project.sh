#!/usr/bin/env bash

if [ -z "$3" ]
then
    echo
    echo Create project to be used with Docker-Compose
    echo
    echo This is script create a pre-defined docker-compose project
    echo
    echo 'The parameters are:'
    echo '  - PROJECT NAME'
    echo '  - Template to be used'
    echo '  - The destination folder'
    echo
    exit 1
fi

PROJECT=$1
TEMPLATE=$2
DESTINATION=$3

if [ ! -d "$DESTINATION" ]
then
    echo "The destination directory does not exists"
    echo
    exit 1
fi

if [ ! -d "$USD_SCRIPTS/docker-compose/projects/$TEMPLATE" ]
then
    echo "The template does not exists"
    echo
    exit 1
fi

cp -r "$USD_SCRIPTS/docker-compose/projects/$TEMPLATE/"* "$DESTINATION"
find "$DESTINATION" -type f -iname 'docker*' -exec  sed -i'' -e "s/@PROJECT@/$PROJECT/g" {} \;

echo Done.




