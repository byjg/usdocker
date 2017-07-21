#!/usr/bin/env bash

dockerMachineWarning

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

if [ ! -z "ELASTICSEARCH_DISCOVERY_NODES" ]; then
    DISCOVERY=" -e discovery.zen.ping.unicast.hosts=$ELASTICSEARCH_DISCOVERY_NODES "
fi

echo "fixing vm.max_map_count (requires sudo)"
sudo sysctl -w vm.max_map_count=262144

docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    --cap-add=IPC_LOCK \
    --ulimit memlock=-1:-1 \
    --ulimit nofile=65536:65536 \
    -e TZ=${TZ} \
    -e ES_JAVA_OPTS="-Xms${ELASTICSEARCH_MEMORY} -Xmx${ELASTICSEARCH_MEMORY}" \
    -e bootstrap.memory_lock=true \
    -e cluster.name=$ELASTICSEARCH_CLUSTER_NAME \
    -e node.name=$ELASTICSEARCH_NODE_NAME \
    -e network.publish_host=$ELASTICSEARCH_PUBLISH_ADDRESS \
    -e node.master=$ELASTICSEARCH_NODE_MASTER \
    -e node.data=$ELASTICSEARCH_NODE_DATA \
    -e node.ingest=$ELASTICSEARCH_NODE_INGEST \
    -p "${ELASTICSEARCH_PORT}:9200" \
    -p "${ELASTICSEARCH_TRANSPORT}:9300" $DISCOVERY \
    -v `adjustLocalDirectories "${ELASTICSEARCH_FOLDER}/data" "/usr/share/elasticsearch/data"` \
    -v `adjustLocalDirectories "$USD_HOME/${USD_SERVICE}/conf/custom.yml" /usr/share/elasticsearch/config/elasticsearch.yml` \
    -d ${ELASTICSEARCH_IMAGE}

checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
