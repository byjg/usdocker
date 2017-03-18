# Useful script - Help for 'docker-compose'

## Install or update the latest docker-compse release into your machine

```
usdocker docker-compose install
```

## docker-compose replacement 

You have a Useful Script replacement for "docker-compose up". This scripts will create a fresh clean container
every time. 

You can handle easily different deploy environments by using customizable settings in docker-composer.

### Basic usage

```
usdocker docker-compose up MACHINE_ID ENVIRONMENT "IMAGES FOR CLEANING" 
```

Where:
- Machine ID is the docker-machine ID for connecting and publish. If you are using your local machine just type 'LOCAL'
- ENVIRONMENT: Can be prod, dev, etc see below the explantion about this feature
- "IMAGES FOR CLEANING" - The images that the script will remove by using the docker rmi <IMAGE>

### Handling different environment

Docker-compose can use script inheritance. For this you have to create the docker-compose.yml and another .yml file. 
Each file must have the name `docker-compose-ENVIRONMENT.yml`

Example:

docker-compose.yml

```
version: '2'
services:
    phpfpm:
        build:
            context: docker/fpm
        network_mode: bridge

    nginx:
        build:
            context: docker/nginx
        network_mode: bridge
        links:
            - phpfpm
        volumes_from:
            - phpfpm
        ports:
            - "80:80"
            - "443:443"
```

docker-compose-dev.yml

```
version: '2'
services:
    phpfpm:
        external_links:
            - mysql-container
        environment:
            - APPLICATION_ENV=dev
```

docker-compose-live.yml

```
version: '2'
services:
    phpfpm:
        extra_hosts:
            mysql-container: 10.11.12.13
        environment:
            - APPLICATION_ENV=live
```

And then you can run

```
usdocker docker-compose up local dev "image1 image2 image3"
```

## docker-compose create-project

Create a docker-compose project based on templates

```
usdocker docker-compose create-project PROJECT-NAME TEMPLATE DESTINATION-FOLDER
```

Available templates
- lemp
