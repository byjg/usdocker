# Directory structure

USDocker save a set of custom setup and all data produced by the user by mapping
volumes where the data is produced or it is necessary to do some setup inside the container. 

There are TWO user directories defined by USDocker

## $HOME/.usdocker

This directory is defined by the global variable USD_HOME and usually have the 'environment' file 
and ALL files for setup your container. 

For example: the my.cnf could be located in $HOME/.usdocker/mysql/conf/my.cnf and when you
run the docker container mapping the volume to this folder/file. 

The 'environment' file have all variables defined by the script.

## $HOME/.usdocker_data

This directory is defined by the global variable USD_DATA and stores all 
data produced by user when it is running the container.

For example: if you run the mysql and postgres, the database will be saved inside this folder. 


