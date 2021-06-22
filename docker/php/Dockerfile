FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
      wget \
      git \
      fish

RUN apt-get update && apt-get install -y libzip-dev libicu-dev libgd-dev && docker-php-ext-install pdo zip intl gd
RUN apt-get update && apt-get install -y libpq-dev && docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install mysqli pdo_mysql
RUN apt-get update && apt-get install -y libmagickwand-dev --no-install-recommends && pecl install imagick && docker-php-ext-enable imagick
RUN pecl install xdebug-2.8.1 && docker-php-ext-enable xdebug
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN wget https://get.symfony.com/cli/installer -O - | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony
ADD xdebug.ini /usr/local/etc/php/conf.d/
ADD php.ini /usr/local/etc/php/
RUN apt-get update && apt-get install -y ffmpeg
RUN pecl install -o -f redis &&  rm -rf /tmp/pear &&  docker-php-ext-enable redis

ARG USER_ID
ARG GROUP_ID

RUN groupadd -f --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

WORKDIR /var/www

EXPOSE 9000