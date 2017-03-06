# Useful script - Help for 'redis'

## usdocker redis start

Start the redis service

## usdocker redis stop

Stop the redis service

## usdocker redis redis-cli

Connect to the redis command line client

## usdocker redis rdm

Connect to the redis desktop manager 

## Customize "<usd_home>/redis/environment"

```
REDIS_IMAGE=redis:3-alpine
REDIS_FOLDER=/var/lib/redis
REDIS_PORT=6379
```

## Customize the "<usd_home>/redis/conf/redis.conf"

Use your own setup for redis changing this file. 

```
# http://download.redis.io/redis-stable/redis.conf
appendonly yes
appendfilename "appendonly.aof"
appendfsync everysec

requirepass password
```