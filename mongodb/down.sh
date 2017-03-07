#!/usr/bin/env bash

dockerMachineWarning

docker stop mongodb${CONTAINER_NAME_SUFFIX}
docker rm mongodb${CONTAINER_NAME_SUFFIX}
