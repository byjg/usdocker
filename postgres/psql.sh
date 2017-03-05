#!/bin/bash

docker exec -it postgres-container psql "$@"

