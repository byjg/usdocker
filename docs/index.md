# USDocker - Useful Scripts for Docker

This is a colletion of useful scripts to make easier brings a service up, down the service, check status
and a lot of other features.
 
Usdocker is highly customizable.

## Basic Usage

The most common usage is:

```
usdocker SERVICE COMMAND
```

If you want start a mysql service you only need to:

```
usdocker mysql up
```

If you call `usdocker SERVICE` without the command you get the help for the service

## Installing usdocker 

### Install from Git (recommended)

```
sudo rm -rf /opt/usdocker
sudo git clone https://github.com/byjg/usdocker.git /opt/usdocker
sudo /opt/usdocker/install/install.sh
```

Using this method you can maintain 'usdocker' updated by using:

```
sudo usdocker self-update
```

### Using the setup script

```
wget -O /tmp/latest http://latest.usdocker.com && sudo bash /tmp/latest && rm /tmp/latest
```


## Installing docker, docker-compose and docker-machine

You can install the docker, docker-compose and docker-machine by using:

```
usdocker docker install
usdocker docker-compose install
usdocker docker-machine install
```

## Useful Scripts Available

Today we have the following Useful Scripts:
- [docker](docker)
- [docker-compose](docker-compose)
- [docker-machine](docker-machine)
- [elasticsearch](elasticsearch)
- [jekyll](jekyll)
- [kibana](kibana)
- [memcached](memcached)
- [mongodb](mongodb)
- [mssql](mssql)
- [mysql](mysql)
- [oracle xe 11g](oracle-xe)
- [php](php)
- [postgres](postgres)
- [redis](redis)
- [redis-sentinel](redis-sentinel)
- [wordpress](wordpress)

Did not found the service you want? Feel free to create it and send to us again! 
Follow our [guide](GUIDE), read about [variables](VARIABLES) and [directories](DIRECTORIES) to create your own script.

## Most common Useful Scripts commands

The most of Useful Scripts have the follow commands available:

### start the service

```
usdocker SERVICE up
```

### stop and kill the service

```
usdocker SERVICE down
```

### setup local folders

The follow command will create the folder with the default service parameters if it does not exists. 
If there are previous existing parameters they are remain unchanged.

```
usdocker SERVICE setup
```

If you want to reset to default parameters and 
**ALL** user data **including** database, data produced by the user and others, just call:

```
usdocker SERVICE setup --reset
```

Reset only the user environment

```
usdocker SERVICE setup --reset-env
```

Reset the user data including database, data produced by the user and others:

```
usdocker SERVICE setup --reset-data
```

Set a value in the service environment. 
**Caution** If you put a wrong value here you can stop the service or cause damage on your computer.  

```
usdocker SERVICE --set key value
```

Note that this operation is irreversible.
 
## Contributing 

If you wanna contributing  to our project and create your own Useful Script for Docker, 
follow our [guide](GUIDE), read about [variables](VARIABLES) and [directories](DIRECTORIES) to create your own.


## *Live/Production environment*

This is script can safely run on live/production environment. But we strongly recommend you backup the data
saved into `$USD_DATA` directory. 

## *Important Note*

*USDocker was implemented to run on the same machine where the docker daemon is running.* 

This script not intended to run from local to remote machines throught docker-machine.
 
If you have a Windows or Mac environment please can install the USDOCKER directly into the remote machine
and run USDOCKER from there.

## *Disclaimer*

THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING, 
BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR 
PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)

HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN 
IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
