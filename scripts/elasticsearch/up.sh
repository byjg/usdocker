#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

if [ "$1" == "dev" ]; then
    SETUPMODE=" -e http.host='0.0.0.0' -e transport.host='127.0.0.1' -p ${ELASTICSEARCH_PORT}:9200 "
elif [ "$1" == "master" ]; then
    SETUPMODE=" -p ${ELASTICSEARCH_PORT}:9200 "
elif [ "$1" == "data" ]; then
    if [ -z "$2" ]; then
        echo "Node requires you inform the IP of the master node"
        exit 1
    fi
    SETUPMODE=" -e discovery.zen.ping.unicast.hosts=$2 "
fi

MODE="-$1"

echo "fixing vm.max_map_count (requires sudo)"
sudo sysctl -w vm.max_map_count=262144

docker run \
    --name ${USD_SERVICE}${MODE}${CONTAINER_NAME_SUFFIX} \
    --cap-add=IPC_LOCK \
    --ulimit memlock=-1:-1 \
    --ulimit nofile=65536:65536 \
    -e ES_JAVA_OPTS="-Xms${ELASTICSEARCH_MEMORY} -Xmx${ELASTICSEARCH_MEMORY}" \
    --publish-all ${SETUPMODE} \
    -v `adjustLocalDirectories "${ELASTICSEARCH_FOLDER}/data/$1" "/usr/share/elasticsearch/data"` \
    -v `adjustLocalDirectories "$USD_HOME/${USD_SERVICE}/conf/custom.yml" /usr/share/elasticsearch/config/elasticsearch.yml` \
    -d ${ELASTICSEARCH_IMAGE}

checkIsRunning ${USD_SERVICE}${MODE}${CONTAINER_NAME_SUFFIX}

#    -e TZ=${TZ} \
