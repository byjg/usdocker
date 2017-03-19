# Useful script - Help for 'kibana'

## Start the kibana service

```
usdocker kibana up
```

## Stop the kibana service

```
usdocker kibana down
```

## Check the status

```
usdocker kibana status
```


## Customize "<usd_home>/kibana/environment"

```bash
KIBANA_IMAGE=docker.elastic.co/kibana/kibana:5.2.2
KIBANA_FOLDER=${USD_DATA}/kibana
KIBANA_PORT=5601
KIBANA_ELASTICSEARCH_URL=http://elasticsearch-container:9200

```

## Customize the "<usd_home>/kibana/conf/custom.yml"

Use your own setup for kibana changing this file. 

```yaml
server.name: kibana
server.host: "0"
elasticsearch.url: http://elasticsearch-container:9200
#elasticsearch.username: elastic
#elasticsearch.password: changeme
xpack.monitoring.ui.container.elasticsearch.enabled: true

xpack.security.enabled: false
```

