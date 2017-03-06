#!/usr/bin/env bash

#USERNAME=" -u backup "   # see $HOME/.my.cnf

mkdir -p /tmp/dump

if [ -z "$1" ]
then
	databases=`/usr/bin/mysql --execute='show databases' --skip-column-names --batch`
else
	databases="$1"
fi

COMMAND="/usr/bin/mysqldump --routines --triggers --events --comments --hex-blob "

for db in $databases
do 

	echo Doing $db...
	$COMMAND $db > /tmp/dump/$db.sql

	sed -i -e 's:\/\*!50017 DEFINER=.* \*\/::g' /tmp/dump/$db.sql
	sed -i '/^\/\*\!50013/d' /tmp/dump/$db.sql

done

