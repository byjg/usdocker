#!/usr/bin/env bash

docker stop wordpress${CONTAINER_NAME_SUFFIX}
docker rm wordpress${CONTAINER_NAME_SUFFIX}

