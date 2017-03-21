#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/elasticsearch/setup.sh"

docker run \
    --name elasticsearch${CONTAINER_NAME_SUFFIX} \
    --cap-add=IPC_LOCK \
    --ulimit memlock=-1:-1 \
    --ulimit nofile=65536:65536 \
    -e ES_JAVA_OPTS="-Xms${ELASTICSEARCH_MEMORY} -Xmx${ELASTICSEARCH_MEMORY}" \
    --publish-all \
    -p "${ELASTICSEARCH_PORT}:9200" \
    -v `adjustLocalDirectories "${ELASTICSEARCH_FOLDER}/data" "/usr/share/elasticsearch/data"` \
    -v `adjustLocalDirectories "$USD_HOME/elasticsearch/conf/custom.yml" /usr/share/elasticsearch/config/elasticsearch.yml` \
    -d ${ELASTICSEARCH_IMAGE}

checkIsRunning elasticsearch${CONTAINER_NAME_SUFFIX}

#    -e TZ=${TZ} \
