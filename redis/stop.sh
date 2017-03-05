#!/bin/bash

docker stop redis${CONTAINER_NAME_SUFFIX}
docker rm redis${CONTAINER_NAME_SUFFIX}