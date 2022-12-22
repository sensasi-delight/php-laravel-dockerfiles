FROM php:8.2-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Overide the entrypoint
COPY ./entrypoints/entrypoint /usr/local/bin/docker-php-entrypoint
COPY ./entrypoints/db_checks.php /usr/local/bin/db_checks.php

RUN chmod +x /usr/local/bin/docker-php-entrypoint


# Create system user (admin) to run Composer and Artisan Commands
RUN useradd -G www-data,root -u 1000 -d /home/admin admin

RUN rm -rf /var/www/*; \
    chown -R admin:www-data /var/www; \
    mkdir -p /home/admin/.composer; \
    mkdir -p /home/admin/logs; \
    chown -R admin:admin /home/admin

# Set working directory
WORKDIR /var/www

USER admin
