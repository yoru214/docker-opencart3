# Docker YML for PHP7.2-apache

Apre built docker containers to run web application pm PHP 7.2 Apache2 server. 

Installed Application installed
- PHP 7.2.16
- Mysql 5.7
- Composer 1.8.4



## Docker Compose

Docker Compose allows us to run our Development or Production Server. 

### Development

Build with all the necessary applications like Composer

Build
```
docker-compose build
```
Run
```
docker-compose up -d
```
Disable
```
docker-compose down
```

### Production

Build with minimal applications. Excludes the installation of composer and other components necessary for development only



<b>Build</b>
```
docker-compose -f docker-compose.yml -f production.yml build
```
Run
```
docker-compose -f docker-compose.yml -f production.yml up -d
```
Disable
```
docker-compose -f docker-compose.yml -f production.yml down
```




## File Heirarchy