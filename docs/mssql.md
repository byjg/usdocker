# Useful script - Help for 'mssql'

## Start the mssql service

```
usdocker mssql up
```

## Stop the mssql service 

```
usdocker mssql down
```

## Connect to the mssql bash

```
usdocker mssql connect
```

## Customize "<usd_home>/mssql/environment"

```
MSSQL_IMAGE=microsoft/mssql-server-linux
MSSQL_FOLDER=/var/lib/mssql
MSSQL_PORT=1433
```
