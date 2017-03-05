# USDocker - Useful Scripts for Docker

This is a colletion of useful scripts for start, stop and use the most of common docker services. 

## Basic Usage

The most common usage is:

```
usdocker SERVICE COMMAND
```

If you want start a mysql service you only need to:

```
usdocker mysql start
```

If you call `usdocker SERVICE` without the command you get the help for the service

## Installing

First on all you need to download the most recent release at [https://github.com/byjg/usdocker/releases]([https://github.com/byjg/usdocker/releases)

and use command:

```
sudo ln -s /path/to/usdocker.sh /usr/local/bin/usdocker
```

### Installing docker, docker-compose and docker-machine

You can install the docker, docker-compose and docker-machine by using:

```
usdocker docker install
usdocker docker-compose install
usdocker docker-machine install
```

## Useful Scripts Available

Today we are the following Useful Scripts:
- docker
- docker-compose
- docker-machine
- memcached
- mongodb
- mssql
- mysql
- php
- postgres
- redis
- wordpress

Did not found the service you want? Feel free to create it and send to us again!

