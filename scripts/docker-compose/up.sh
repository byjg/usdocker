#!/usr/bin/env bash

echo
echo Docker-Compose Up in a always fresh machine environment.
echo

if [ -z "$2" ]
then
    echo This is script intended to "docker-compose up" a fresh environment, cleaning before docker-compose:
    echo   - ALL VOLUMES,
    echo   - ALL CONTAINERS
    echo   - AND SELECTED IMAGES
    echo
    echo 'You have to specify:'
    echo '  - the MACHINE_ID (or local)'
    echo '  - the enviroment (PROD, DEV, etc) - Your have to create a secondary docker-compose-PROD.yml, docker-composer-DEV.yml for it'
    echo '  - The images using quotes (eg. "image1 image2 image3")'
    echo
    exit 1
fi

MACHINEID=$1
MACINEENV=$2
IMAGES=$3

if [ ! -f "docker-compose.yml" ]
then
    echo "File 'docker-compose.yml' does no exists"
    echo
    exit 1
fi

if [ ! -f "docker-compose-${MACINEENV}.yml" ]
then
    echo "File 'docker-compose-${MACINEENV}.yml' does no exists"
    echo
    exit 1
fi

# Save old Setup
echo Save old docker-machine setup...
OLD_DOCKER_CERT_PATH="$DOCKER_CERT_PATH"
OLD_DOCKER_HOST="$DOCKER_HOST"
OLD_DOCKER_MACHINE_NAME="$DOCKER_MACHINE_NAME"
OLD_DOCKER_TLS_VERIFY="$DOCKER_TLS_VERIFY"

# Define Configuration
echo Apply new docker-machine setup...
if [ "$MACHINEID" == "local" ]
then
    echo "Setting to run on LOCAL docker-machine..."
    unset DOCKER_CERT_PATH
    unset DOCKER_HOST
    unset DOCKER_MACHINE_NAME
    unset DOCKER_TLS_VERIFY
else
    echo "Setting to run on docker-machine $MACHINEID ..."
    eval $(docker-machine env $MACHINEID)
    if [ "$DOCKER_MACHINE_NAME" != "$MACHINEID" ]
    then
        echo .
        echo .
        echo "I cannot set up this machine. "
        echo "Do you have the proper certificates? Is it exists? Is it running?"
        exit 1
    fi
fi


echo "+--------------------------------------------------------------------"
echo "| Check configuration before proceed"
echo "|"
echo "| MACHINE_ID=${MACHINEID}"
echo "| MACHINE HOST=${DOCKER_HOST}"
echo "| ENVIRONMENT=${MACINEENV}"
echo "| Remove Images: ${IMAGES}"
echo "+--------------------------------------------------------------------"
echo
echo "Press ENTER to continue or CTRL+C for abort"
read

# Execute Actions
echo Execute actions...
echo   ...stopping containers
docker-compose down
if [ ! -z "$IMAGES" ]
then
    echo   ...removing images
    docker rmi $IMAGES
fi
echo   ...removing volumes
docker volume ls -q | xargs docker volume rm
echo   ...building and UP new image
docker-compose -f docker-compose.yml -f docker-compose-${MACINEENV}.yml up -d --build

# Restore Setup
echo Restoring setup...
DOCKER_CERT_PATH="$OLD_DOCKER_CERT_PATH"
DOCKER_HOST="$OLD_DOCKER_HOST"
DOCKER_MACHINE_NAME="$OLD_DOCKER_MACHINE_NAME"
DOCKER_TLS_VERIFY="$OLD_DOCKER_TLS_VERIFY"

echo End.




