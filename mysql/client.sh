#!/usr/bin/env bash

docker exec -it mysql${CONTAINER_NAME_SUFFIX} mysql "$@"

