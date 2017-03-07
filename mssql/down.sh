#!/usr/bin/env bash

dockerMachineWarning

docker stop mssql${CONTAINER_NAME_SUFFIX}
docker rm mssql${CONTAINER_NAME_SUFFIX}
