# Useful script - Help for 'elasticsearch'

## Start the elasticsearch service

```
usdocker elasticsearch up
```

## Stop the elasticsearch service

```
usdocker elasticsearch down
```

## Check the status

```
usdocker elasticsearch status
```

## Creating a cluster of elasticsearch nodes

Creating an elasticsearch cluster with usdocker is pretty easy.

On the node `server 1` just run:

```bash
usdocker elasticsearch setup --set ELASTICSEARCH_CLUSTER_NAME mycluster
usdocker elasticsearch up
```

and on the node `server 2` run:

```bash
usdocker elasticsearch setup --set ELASTICSEARCH_CLUSTER_NAME mycluster
usdocker elasticsearch setup --set ELASTICSEARCH_DISCOVERY_NODES ip.server.1
usdocker elasticsearch up
```

Some notes:

- The setup just need to be called at the very first time. The next call even you rebooted the machine is not necessary
- Check if ELASTICSEARCH_NODE_NAME is what you want
- Check if ELASTICSEARCH_PUBLISH_ADDRESS have the correct IP
- Check if the ELASTICSEARCH_PUBLISH_ADDRESS is accessible from all the nodes will join the cluster
- Open the ports 9200 and 9300.

## Creating nodes from different types:

You can create a node with a specific function only (master, data or ingest).

To do it setup with true or false the following options:

```bash
usdocker elasticsearch setup --set ELASTICSEARCH_NODE_MASTER true
usdocker elasticsearch setup --set ELASTICSEARCH_NODE_DATA true
usdocker elasticsearch setup --set ELASTICSEARCH_NODE_INGEST true
```


## Customize "<usd_home>/elasticsearch/environment"

```bash
ELASTICSEARCH_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:5.5.0
ELASTICSEARCH_FOLDER=${USD_DATA}/elasticsearch
ELASTICSEARCH_MEMORY=1g
ELASTICSEARCH_PORT=9200
ELASTICSEARCH_TRANSPORT=9300
ELASTICSEARCH_CLUSTER_NAME=docker-cluster
ELASTICSEARCH_NODE_NAME=localhost
ELASTICSEARCH_PUBLISH_ADDRESS=127.0.0.1
ELASTICSEARCH_DISCOVERY_NODES=
ELASTICSEARCH_NODE_MASTER=true
ELASTICSEARCH_NODE_DATA=true
ELASTICSEARCH_NODE_INGEST=true
```

## Customize the "<usd_home>/elasticsearch/conf/custom.yml"

Use your own setup for elasticsearch changing this file. 

X-Pack is preinstalled in this image and is enabled.
X-Pack includes a trial license for 30 days.
If you have a X-Pach license, comment the line below

https://www.elastic.co/guide/en/x-pack/current/security-getting-started.html

```yaml
xpack.security.enabled: false
```

