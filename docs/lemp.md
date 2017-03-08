# Nginx Generic Host

This Useful Script creates a really generic NGINX+PHP+MYSQL server. 

The server will be recognize the domain and select dynamically the folder where this domain will be serve pages.

The default ROOT for the server is:

```
$HOME/usdocker-lemp
```

If you wanna serve pages for domain "example.com" you just have to create a folder:

```
$HOME/usdocker-lemp/example.com
```

And you will serve pages for this domain immediatelly. If inside this folder you have any of this folders:

- web
- httpdocs
- public 

the root directory will be:

```
$HOME/usdocker-lemp/example.com/web
or
$HOME/usdocker-lemp/example.com/httpdocs
or
$HOME/usdocker-lemp/example.com/public
```

The script pre-route PHP files called index.php or web.php.

## Let's start:

```
usdocker mysql up
usdocker lemp up
```
