#!/bin/bash

docker stop mssql${CONTAINER_NAME_SUFFIX}
docker rm mssql${CONTAINER_NAME_SUFFIX}
