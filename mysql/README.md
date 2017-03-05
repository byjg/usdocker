# Useful script - Help for 'mysql'

## usdocker mysql start

Start the mysql service

## usdocker mysql stop

Stop the mysql service

## usdocker mysql client

Run the mysql-client command line interface

## usdocker mysql connect

Connect to the mysql bash interface

## usdocker mysql dump

Dump the database and save it to the /tmp/dump folder. 


## Customize "<usd_home>/mysql/environment"

MYSQL_IMAGE=mysql:5.7
MYSQL_FOLDER=/var/lib/mysql
MYSQL_PORT=3306
MYSQL_ROOT_PASSWORD=password

## Customize the "<usd_home>/mysql/conf.d/custom.cnf"

Use your own setup for mysql changing this file. 

```
[mysqld]
bind-address = 0.0.0.0

[mysqldump]
quick
quote-names
max_allowed_packet      = 16M
```

## Customize the "<usd_home>/mysql/home/"

This folder exists for setup the database dump. You have only edit the file .my.cnf with the following setup:

```
[mysqldump]
user=backup
password=PasSWord
```
