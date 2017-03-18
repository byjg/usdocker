#!/usr/bin/env bash

dockerMachineWarning

CONTAINERS=$(docker ps -a -q)

echo Removing Stopped Containers...
if [ ! -z "$CONTAINERS" ]
then
    docker rm $CONTAINERS
fi

VOLUMES=$(docker volume ls -qf dangling=true)

echo Removing dangling volumes...
if [ ! -z "$VOLUMES" ]
then
    docker volume rm $VOLUMES
fi

IMAGES=$(docker images -f "dangling=true" -q)

echo Removing Dangling Images...
if [ ! -z "$IMAGES" ]
then
    docker rmi
fi

echo Done.
