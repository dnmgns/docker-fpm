# Let's rock
FROM php:5.6-fpm

MAINTAINER moo

# Update packs
RUN apt-get update && apt-get install -y rsync && rm -r /var/lib/apt/lists/*

# install the PHP extensions we need
RUN apt-get update && apt-get install -y libpng12-dev && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install gd \
    && apt-get purge --auto-remove -y libpng12-dev

# install mysql connector module
RUN docker-php-ext-install mysqli

# Add www volume
VOLUME /var/www/
WORKDIR /var/www/

# Move to the directory were the php files stands
CMD ["php-fpm"]