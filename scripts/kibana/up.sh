#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/kibana/setup.sh"

docker run \
    --name kibana${CONTAINER_NAME_SUFFIX} \
    -e "ELASTICSEARCH_URL=${KIBANA_ELASTICSEARCH_URL}" \
    -p "${KIBANA_PORT}:5601" \
    -v `adjustLocalDirectories "$USD_HOME/kibana/conf/custom.yml" /usr/share/kibana/config/kibana.yml` \
    -e TZ=${TZ} `linkContainer` \
    -d ${KIBANA_IMAGE}

checkIsRunning kibana${CONTAINER_NAME_SUFFIX}

#    -v `adjustLocalDirectories "${KIBANA_FOLDER}/data" "/usr/share/kibana/data"` \
