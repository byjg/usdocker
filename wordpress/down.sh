#!/usr/bin/env bash

dockerMachineWarning

docker stop wordpress${CONTAINER_NAME_SUFFIX}
docker rm wordpress${CONTAINER_NAME_SUFFIX}

