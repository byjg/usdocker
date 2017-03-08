# Useful script - Help for 'mongodb'

## Start the mongodo service

```
usdocker mongodb up
```

## Stop the mongodb service 

```
usdocker mongodb down
```

## Start the mongodb client

```
usdocker mongodb client
```

## Customize "<usd_home>/mongodb/environment"

```
MONGODB_IMAGE=mongo:3
MONGODB_PORT=27017
MONGODB_FOLDER=/var/lib/mongodb
```