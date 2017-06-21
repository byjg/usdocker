# USDocker Variables

## Global

USDocker defines several variables for make it easier create your
script. Prefer use these variables:

| Variable       | Description               |
|----------------|---------------------------|
| USD_DIR        | USDOCKER root directory   |
| USD_INCLUDE    | Include directory         |
| USD_SCRIPTS    | Directory of USDOCKER scripts |
| USD_SERVICE    | The service, e.g. mysql, postgres, etc |
| USD_LABEL      | The label of the service, e.g. MYSQL, POSTGRES, etc |
| USD_COMMAND    | The script inside the service, e.g. up, status, etc |
| USD_DOCS       | Documentation directory  |
| USD_HOME       | Current user's directory where custom definition are located |
| USD_DATA       | Current user's directory where volumes shared with the container are stored  |

## Environment

Besides the global variables, USDocker defines a set of other variables like 'TZ', 
'CONTAINER_NAME_SUFFIX' and the variables defined in your 'setup.sh' using the setupEnvironment helper. 

The scope of this variables is only on run-time. You can check this variables by using the command:

*global variables*

```
usdocker env
```

*service scope variables*

```
usdocker YOURSERVICE env
```

You can set all variables (except the globals) using the command:

```
usdocker YOURSERVICE setup --set "VARIABLE" "VALUE"
```

You can also reset all variables values and return to defaults by using: 

```
usdocker YOURSERVICE setup --reset-env
```






