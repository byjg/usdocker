#!/usr/bin/env bash

dockerMachineWarning

docker stop postgres${CONTAINER_NAME_SUFFIX}
docker rm postgres${CONTAINER_NAME_SUFFIX}
