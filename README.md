# Docker YML for PHP7.2-apache


Installed Application installed
- PHP 7.2.16
- Mysql 5.7
- Composer 1.8.4

# Development

docker-compose build
docker-compose up -d
docker-compose down

docker-compose -f docker-compose.yml -f production.yml build
docker-compose -f docker-compose.yml -f production.yml up -d
docker-compose -f docker-compose.yml -f production.yml down