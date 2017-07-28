# Useful script - Help for 'oracle-xe 11g'

## Basic info:

**Connect database with following setting:**

- hostname: localhost
- port: 1521
- sid: xe
- username: system
- password: oracle

**Password for SYS & SYSTEM:** oracle

**Connect to Oracle Application Express web management:**

- http://localhost:8080/apex
- workspace: INTERNAL
- user: ADMIN
- password: oracle


## Start the oracle-xe 11g service

```
usdocker oracle-xe up
```

*Note*: Could take several minutes until the service becomes available

## Stop the oracle-xe 11g service 

```
usdocker oracle-xe down
```

## Connect to the oracle-xe 11g bash

```
usdocker oracle-xe connect
```

## Connect to the sqlplus client

```
usdocker oracle-xe sqlplus
```

or

```
usdocker oracle-xe sqlplus system/oracle
```

## Alter 'sys' and 'system' password on startup

```
usdocker oracle-xe setup --set ORACLE_XE_PASSWORD=newpassword
usdocker oracle-xe setup --set ALLOW_IMPORT=true
usdocker oracle-xe up
```


## Customize "<usd_home>/oracle-xe/environment"

```
ORACLE_XE_IMAGE=sath89/oracle-xe-11g
ORACLE_XE_FOLDER=${USD_DATA}/${USD_SERVICE}
ORACLE_XE_PASSWORD=oracle
ORACLE_XE_ALLOW_IMPORT=true
ORACLE_XE_PORT=1521
ORACLE_XE_APEX=8080
ORACLE_XE_PROCESSES=500
ORACLE_XE_SESSIONS=555
ORACLE_XE_TRANSACTIONS=610
```
