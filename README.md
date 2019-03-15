# Docker YML for PHP7.2-apache

A pre built docker containers to run web application pm PHP 7.2 Apache2 server. 

Installed Application installed
- PHP 7.2.16
- Mysql 5.7
- Composer 1.8.4



## Docker Compose

Docker Compose allows us to run our Development or Production Server. 

### Development

Build with all the necessary applications like Composer

<b>Build</b>

>docker-compose build

<b>Run</b>

>docker-compose up -d

<b>Disable</b>

>docker-compose down


### Production

Build with minimal applications. Excludes the installation of composer and other components necessary for development only



<b>Build</b>

>docker-compose -f docker-compose.yml -f production.yml build

<b>Run</b>

>docker-compose -f docker-compose.yml -f production.yml up -d

<b>Disable</b>
>docker-compose -f docker-compose.yml -f production.yml down



## File Heirarchy

```terminal
app
  - index.php
db_data
  - development
  - master
  - slave
docker
  - development
    - apache
      - certs
        - weblocal.crt
      - config
        - apache2.conf
        - site.conf
        - ssl.conf
      - ssl
        - domain.crt
        - domain.csr
        - domain.key
        - domain.pem
    - mysql
      - Dockerfile
  - production 
    - apache
      - certs
        - weblocal.crt
      - config
        - apache2.conf
        - site.conf
        - ssl.conf
      - ssl
        - domain.crt
        - domain.csr
        - domain.key
        - domain.pem
    - mysql
      - configure
        - Dockerfile
      - master
        - config
          - master.cnf
        - Dockerfile
      - slave
        - config
          - slave.cnf
        - Dockerfile
      - shell
        - mysql
          - mysql_connector.sh
```

## Directory Usage
```
app
  - index.php
```
This is the default root web directory equivalent to `/var/www/html` on your apache server. The `index.php` is where the `phpinfo()` is printed. So at first run you will see the PHP Info printed. 

```
db_data
  - development
  - master
  - slave
```
Been trying to include on the commit but the directory gets ignored. So don't be surprised if directory is not visible on the git repo. It is automatically generated as you run the docker image. So no need to worry much. 

This is the directory where MySQL data is being save for data persistence purposes. It is equivalent to the `/var/lib/mysql` on your linux server. The `development` directory is where the MySQL for your development is being saved. The `master` and `slave` directory is where the MySQL for your production and its slave database is being saved.

You might wonder why there is a `slave` database on the production. I was developing an application which caters millions of rows. The client wants to have an automatic back up to file as well as allow him to back up the database manually via the application. The problem is, the application runs 24/7 and has data entries all the time. Running an sql dump back up stops the server as it locks the table and unlocks after execution is finish. If locking is not enable, I end up with some corrupted back ups.

The solution I made was create a slave database, `stop slave` then perform back up then when back up is finished `starts the slave` again.

```
docker
  - development
    ...
  - production
    ...
```
This is the root directory where docker container important configurations and files of each internal services persistently stored. 
