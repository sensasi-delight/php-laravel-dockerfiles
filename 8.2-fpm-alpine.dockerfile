FROM php:8.2-fpm-alpine

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
COPY ./entrypoints/entrypoint /usr/local/bin/docker-php-entrypoint
COPY ./entrypoints/db_checks.php /usr/local/bin/db_checks.php

RUN chmod +x /usr/local/bin/docker-php-entrypoint

RUN rm -r /var/www


# Create system user to run Composer and Artisan Commands
RUN adduser -g www-data -D -u 1000 -h /home/admin admin
RUN addgroup admin root

RUN rm -rf /var/www/*; \
    chown -R admin:www-data /var/www; \
    mkdir -p /home/admin/.composer; \
    mkdir -p /home/admin/logs; \
    chown -R admin:admin /home/admin

# Set working directory
WORKDIR /var/www

USER admin
