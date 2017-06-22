<!DOCTYPE html>
<html>
<head>
    <title>Welcome to nginx powered by USDocker lemp script!</title>
    <style>
        body {
            width: 35em;
            margin: 0 auto;
            font-family: Tahoma, Verdana, Arial, sans-serif;
        }
    </style>
</head>
<body>
<h1>
    Welcome to usdocker lemp!
</h1>
<p>If you see this page, the nginx web server and PHP 7.0 is successfully installed and
    working. Further configuration is required.</p>

<div style="font-size: large; font-weight: bold">Domain: <?php echo $_SERVER['X_Lemp_Domain']; ?></div>

<p>For online documentation and support please refer to
    <a href="http://usdocker.com/">usdocker.com</a>.<br/>
    Commercial support is available at
    <a href="http://usdocker.com/">usdocker.com</a>.</p>

<p><em>Thank you for using usdocker.</em></p>
</body>
</html>
