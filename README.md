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
```shell
docker-compose build
```
<b>Run</b>
```shell
docker-compose up -d
```
<b>Disable</b>
```shell
docker-compose down
```

### Production

Build with minimal applications. Excludes the installation of composer and other components necessary for development only



<b>Build</b>
```shell
docker-compose -f docker-compose.yml -f production.yml build
```
<b>Run</b>
```shell
docker-compose -f docker-compose.yml -f production.yml up -d
```
<b>Disable</b>
```shell
docker-compose -f docker-compose.yml -f production.yml down
```




## File Heirarchy

```
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