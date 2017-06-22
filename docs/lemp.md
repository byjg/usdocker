# Nginx Generic Host

This Useful Script creates a really generic NGINX+PHP+MYSQL server. 

The server will be recognize the domain and select dynamically the folder where this domain will be serve pages.

The default ROOT for the server is:

```
$HOME/.usdocker_data/lemp
```

If you wanna serve pages for domain "example.com" you just have to create a folder:

```
usdocker lemp domain-add example.com
```

And you will serve pages for this domain immediatelly. 
This script tries to find the follow directories to server web pages:

- web
- httpdocs
- public 

If found, the directory for the web pages will be, respectively:

```
$HOME/.usdocker_data/lemp/example.com/web
or
$HOME/.usdocker_data/lemp/example.com/httpdocs
or
$HOME/.usdocker_data/lemp/example.com/public
```

If not found will serve the root directory directly

## Let's start:

```
usdocker mysql up
usdocker lemp up
```

