FROM php:7.4-fpm-alpine

# Install system dependencies
RUN apk add --no-cache \
    git \
    curl \
    libjpeg-turbo-dev \
    libpng-dev \
    oniguruma-dev \
    libxml2-dev \
    zip \
    unzip

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    mbstring \
    exif \
    pcntl \
    bcmath \
    gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Overide the entrypoint
COPY ./entrypoints/fpm-alpine-entrypoint /usr/local/bin/docker-php-entrypoint
COPY ./entrypoints/db_checks.php /usr/local/bin/db_checks.php

RUN chmod +x /usr/local/bin/docker-php-entrypoint
