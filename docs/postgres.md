# Useful script - Help for 'postgres'

## Start the postgres service

```
usdocker postgres up
```

## Stop the postgres service 

```
usdocker postgres down
```

## Connect to the postgres bash

```
usdocker postgres connect
```

## Connect to the psql client

```
usdocker postgres psql
```

## Customize "<usd_home>/postgres/environment"

```
POSTGRES_IMAGE=postgres:9-alpine
POSTGRES_FOLDER=/var/lib/postgresql/data
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_PORT=5432
```
