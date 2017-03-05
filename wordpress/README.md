# Useful script - Help for 'wordpress'

## usdocker wordpress start

Start the wordpress service

## usdocker wordpress stop

## Customize "<usd_home>/environment-wordpress"

wordpressWORDPRESS_IMAGE=wordpress
#wordpressWORDPRESS_PLUGIN_FOLDER /var/lib/wordpress
#wordpressWORDPRESS_THEME_FOLDER /var/lib/wordpress
wordpressWORDPRESS_PORT=8080
wordpressWORDPRESS_DB_HOST=mysql${CONTAINER_NAME_SUFFIX}:3306
wordpressWORDPRESS_DB_USER=root
wordpressWORDPRESS_DB_PASSWORD=password

## Customize the "<usd_home>/wordpress/conf/uploads.ini"

Use your own setup for wordpress changing this file. 

```
file_uploads = On
memory_limit = 256M
upload_max_filesize = 256M
post_max_size = 300M
max_execution_time = 600
```
