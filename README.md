# Docker YML for CakePHPv3.7.4


Docker Compose Project to run a development server for CakePHP version 3.7.4
Installed Application installed
- PHP 7.2.16
- Mysql 5.7
- CakePHP 3.7.4
- Composer 1.8.4
# Development

docker-compose build
docker-compose up -d
docker-compose down

docker-compose -f docker-compose.yml -f production.yml build
docker-compose -f docker-compose.yml -f production.yml up -d
docker-compose -f docker-compose.yml -f production.yml down