#!/usr/bin/env bash

dockerMachineWarning

docker stop memcached${CONTAINER_NAME_SUFFIX}
docker rm memcached${CONTAINER_NAME_SUFFIX}