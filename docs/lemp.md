# Nginx Generic Host

This Useful Script creates a really generic NGINX+PHP+MYSQL server. 

The server will be recognize the domain and select dynamically the folder where this domain will be serve pages.

The default ROOT for the server is:

```
$HOME/.usdocker_data/lemp
```

## Starting serving a domain

If you wanna serve pages for domain "example.com" you just have to create a folder:

```bash
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

## Serve a domain with a previous specific content

Optionally, you can create a domain with a pre-defined content existing in a tar.gz file. 
 
To do this execute:

```bash
usdocker lemp domain-add example.com /path/to/file.tar.gz
```

## Remove a domain

```bash
usdocker lemp domain-del example.com
```

## List served domains

```bash
usdocker lemp domain-list
```

# Let's start:

```bash
usdocker mysql up
usdocker lemp up
```

