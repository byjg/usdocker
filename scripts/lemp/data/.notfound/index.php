<html>
    <head>
        <style>
            code {
                display: block;
                margin: 1em;
                background-color: #EEEEEE;
                padding: 1em;
            }
            div {
                margin: 1em 0 1em 0;
            }
            .highlight {
                font-weight: bolder;
                font-size: large;
            }
        </style>
    </head>
    <body>
        <h1><?php echo $_SERVER['X_Lemp_Domain']; ?> :(</h1>
        <div>You reach this page because you try to access the domain
            '<span class="highlight"><?php echo $_SERVER['X_Lemp_Domain']; ?></span>'
            but it is not setup properly.</div>
        <div>Try to add the domain by using:
            <code>
            usdocker lemp domain-add <?php echo $_SERVER['X_Lemp_Domain']; ?>
            </code>
            <br/>
            and then add some stuff in the folder:
            <br/>
            <code>
                <?php echo $_ENV['LEMP_DATA_FOLDER'] . '/' . $_SERVER['X_Lemp_Domain']; ?>
            </code>
        </div>
    </body>
</html>
