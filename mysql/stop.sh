#!/bin/bash

docker stop mysql${CONTAINER_NAME_SUFFIX}
docker rm mysql${CONTAINER_NAME_SUFFIX}

