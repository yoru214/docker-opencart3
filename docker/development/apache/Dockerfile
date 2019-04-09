FROM php:7.2-apache

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    git \
    zip \
    unzip \
    curl 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Test Composer Installation
RUN composer


# Create tmp directory and make it writable by the web server
RUN mkdir -p \
    tmp/cache/models \
    tmp/cache/persistent \
  && chown -R :www-data \
    tmp \
  && chmod -R 770 \
    tmp

RUN apt-get update
RUN apt-get install -y zlib1g-dev libicu-dev g++
RUN apt-get install locate
RUN docker-php-ext-install zip
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install gd
RUN docker-php-ext-configure intl
RUN docker-php-ext-install intl
RUN docker-php-ext-install pdo_mysql


# COPY apache configuration setting web.local as server name
COPY ./docker/development/apache/config/apache2.conf /etc/apache2/apache2.conf
# COPY apache configuration for web.local file
COPY ./docker/development/apache/config/site.conf /etc/apache2/sites-available/000-default.conf
# COPY apache configuration for web.local ssl file
COPY ./docker/development/apache/config/ssl.conf /etc/apache2/sites-available/default-ssl.conf


COPY ./docker/development/apache/ssl/domain.key /etc/ssl/domain.key
COPY ./docker/development/apache/ssl/domain.csr /etc/ssl/domain.csr
COPY ./docker/development/apache/ssl/domain.crt /etc/ssl/domain.crt
COPY ./docker/development/apache/ssl/domain.pem /etc/ssl/domain.pem

COPY ./docker/development/apache/certs/weblocal.crt /etc/certs/weblocal.crt


ENV PATH="${PATH}:/var/www/html/"
ENV PATH="${PATH}:/var/www/html/app/bin"

# Enable SSL
RUN a2enmod ssl
# Enable Mod Rewrite
RUN a2enmod rewrite

# Enable SSL Site
RUN a2ensite default-ssl

# Restart Apache
RUN service apache2 restart


EXPOSE 80
EXPOSE 443