#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run --rm -it \
  --volume=${JEKYLL_FOLDER}:/srv/jekyll \
  --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
  ${JEKYLL_IMAGE} \
  bash
