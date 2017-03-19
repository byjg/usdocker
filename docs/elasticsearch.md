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


## Customize "<usd_home>/elasticsearch/environment"

```bash
ELASTICSEARCH_IMAGE=docker.elastic.co/elasticsearch/elasticsearch:5.2.2
ELASTICSEARCH_FOLDER=${USD_DATA}/elasticsearch
ELASTICSEARCH_MEMORY=1g
ELASTICSEARCH_PORT=9200
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

