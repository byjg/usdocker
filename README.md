# USDocker - Useful Scripts for Docker

This is a colletion of useful scripts to make easier brings a service up, down the service, check status
and a lot of other features.
 
Usdocker is highly customizable.

## Basic Usage

The most common usage is:

```
usdocker SERVICE COMMAND
```

If you want start a mysql service you only need to:

```
usdocker mysql up
```

If you call `usdocker SERVICE` without the command you get the help for the service

## Installing

First on all you need to download the most recent release at [https://github.com/byjg/usdocker/releases]([https://github.com/byjg/usdocker/releases)

and use command:

```
sudo ln -s /path/to/usdocker.sh /usr/local/bin/usdocker
```

Add the autocomplete for debian systems

```
sudo cp /path/to/bash_completion_debian.sh /etc/bash_completion.d/usdocker
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

## *Important Note*

USDocker was implemented to run on the same machine where the docker daemon is running. 

I am running into a situation where I got permission denied when the service try to write on the shared volume. 
The issue #1 is opened and suggestion are welcome. 

