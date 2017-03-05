#!/usr/bin/env bash

docker exec -it mongodb${CONTAINER_NAME_SUFFIX} mongo "$@"
