FROM php:7.3-apache
RUN apt-get update -yqq \
    && apt-get -yqq install wget \ 
    && docker-php-ext-install pdo_mysql mysqli  \
    && apt-get clean

RUN a2enmod rewrite