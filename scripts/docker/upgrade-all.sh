#!/usr/bin/env bash

dockerMachineWarning

IMGS=$(docker images | grep -v REPOSITORY | awk '{print $1":"$2}' | grep -v none)

for IMAGE in `echo $IMGS`
do
    echo $IMAGE
    echo ---------------------------------------------------------------
    docker pull $IMAGE
    echo
done

echo Done.




