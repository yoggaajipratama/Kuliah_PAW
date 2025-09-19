FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
    curl \
    && docker-php-ext-install mbstring pdo_mysql zip xml

WORKDIR /var/www/

COPY . /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --1 --install-dir=/usr/local/bin --filename=composer

RUN composer install