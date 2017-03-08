# Useful script - Help for 'memcached'

## Start the memcached service

```
usdocker memcached up
```

## Stop the memcached service

```
usdocker memcached down
```

## Customize "<usd_home>/memcached/environment"

```
MEMCACHED_IMAGE=memcached:alpine
MEMCACHED_FOLDER=/var/lib/memcached
MEMCACHED_PORT=11211
MEMCACHED_MEMORY=1
```
