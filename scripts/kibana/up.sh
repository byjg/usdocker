#!/usr/bin/env bash

dockerMachineWarning

checkDependency elasticsearch

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} `linkContainer` \
    -e "ELASTICSEARCH_URL=${KIBANA_ELASTICSEARCH_URL}" \
    -p "${KIBANA_PORT}:5601" \
    -v `adjustLocalDirectories "$USD_HOME/kibana/conf/custom.yml" /usr/share/kibana/config/kibana.yml` \
    -v `adjustLocalDirectories "${KIBANA_FOLDER}/data" "/usr/share/kibana/data"` \
    -d ${KIBANA_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}

#    -e TZ=${TZ} \
