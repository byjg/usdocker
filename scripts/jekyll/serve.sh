#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run -it --rm \
  --volume=${JEKYLL_FOLDER}:/srv/jekyll \
  --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
  -p "${JEKYLL_PORT}:4000" \
  ${JEKYLL_IMAGE} \
  jekyll serve --watch --incremental
