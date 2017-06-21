# Guide for create your own Useful Script

The useful scripts are a bunch of bash scripts with a several helpers
for aid you to control and run your docker instance

Basically the bash scripts are located inside the folder `$USD_SCRIPTS/yourservice` 
and each bash script is a command.

There are a basic guideline for the names of the bash scripts. 
The "setup.sh" script is mandatory and must follow some rules.

## setup.sh

This script is used for setup the environment used for the other scripts you create.
It must follow the model below:

```
#!/usr/bin/env bash

# Environment
setupEnvironment $USD_SERVICE/environment IMAGE docker/image:tag
source "$USD_HOME/$USD_SERVICE/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
resetData $1 SOMEFOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
cp somesetup $USD_HOME/$USD_SCRIPT
```

### The Environment section

The first section. Will setup all customizable variables inside your other scripts.
We recommend define at least the `IMAGE` that represents the docker image and tag for your service.

**Note:** Using the setupEnvironment you do not need pass the name of the script but the
name of the environment variable will be YOURSERVICE_YOURVARIABLE. In that case 'YOURVARIABLE' is IMAGE

For example: The MySQL docker image defined by default is mysql:5.7, but you can change easily by using:

```
usdocker mysql setup --set MYSQL_IMAGE mysql:5.6
```

To refer your environment variable inside the script just use:

```
$MYSQL_IMAGE   or
${USD_LABEL}_IMAGE
```

### The Reset section

This section will address the parameters --reset, --reset-data and --reset-env.

Use the the commads as defined in the example. The `resetData` will be used for delete the $USD_HOME of the user.  

### The set key and value section

This section will address the parameter --set. 

Use the the commads as defined in the example.   

### The data section

This section is optional and is used for copy some data to the $USD_HOME directory.


## Writing your own scripts

### Service

Create a service (e.g. mysql database) you need to create the follow scripts:

- setup.sh
- up.sh
- down.sh
- restart.sh
- status.sh

#### up.sh

The basic structure is:

```
# Warning the user if this script does not run well with docker-machine  
dockerMachineWarning

# Read the setup.sh
source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

# Start the docker daemon
docker run \
    --name ${USD_SERVICE}${CONTAINER_NAME_SUFFIX} \
    -e ...environment variable... \
    -p ...port mapping... \
    -v `adjustLocalDirectories "${SCRIPT_FOLDER}" "/docker/folder"` \
    -e TZ=${TZ} \
    -d ${SCRIPT_IMAGE}

# Check if is running sucessful
checkIsRunning ${USD_SERVICE}${CONTAINER_NAME_SUFFIX}
```

Try to use all variables defined in the setup.sh section and pass all parameters 
necessary in order to run your docker daemon. 

#### down.sh

```
dockerDown $USD_SERVICE
```

#### restart.sh

```
dockerRestart $USD_SERVICE
```

#### status.sh

```
dockerStatus $USD_SERVICE
```

### Creating Commands

Create a command based on a docker follow the reference from the `up.sh` script, except for:

- there is no `checkIsRunning`
- remove the daemon parameter (`-d`)
- if is necessary, add the interactive parameter and the remove container (`-it --rm`)

### Passing parameters to your script

All extra parameter is passed to your script following the order `$1`, `$2`, and so on. 

## Global Variables

See also the how to use the [USDocker variables](VARIABLES)