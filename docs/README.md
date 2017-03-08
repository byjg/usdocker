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
- [docker](/docker)
- [docker-compose](/docker-compose)
- [docker-machine](/docker-machine)
- [memcached](/memcached)
- [mongodb](/mongodb)
- [mssql](/mssql)
- [mysql](/mysql)
- [php](/php)
- [postgres](/postgres)
- [redis](/redis)
- [wordpress](/wordpress)

Did not found the service you want? Feel free to create it and send to us again!

## Most common Useful Scripts commands

The most of Useful Scripts have the follow commands available:

### start the service

```
usdocker SERVICE up
```

### stop and kill the service

```
usdocker SERVICE down
```

### setup local folders

The follow command will create the folder id they not exists and remain unchanged if exists.

```
usdocker SERVICE setup
```

If you want to reset to default parameters and user data just call:

```
usdocker SERVICE setup --reset
```

Reset only the user environment

```
usdocker SERVICE setup --reset-env
```

Reset only the user data (including database, etc)

```
usdocker SERVICE setup --reset-data
```


Note that this operation is irreversible. 

## *Important Note*

USDocker was implemented to run on the same machine where the docker daemon is running. 

I am running into a situation where I got permission denied when the service try to write on the shared volume. 
The issue #1 is opened and suggestion are welcome. 

