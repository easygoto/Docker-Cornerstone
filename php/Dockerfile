FROM php:7.4-fpm-alpine
COPY composer.phar /usr/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
RUN docker-php-ext-install gd pdo_mysql pdo_pgsql opcache zip exif pcntl \
RUN pecl install xdebug \
RUN docker-php-ext-enable xdebug \
RUN pecl install mongodb \
RUN docker-php-ext-enable mongodb \
RUN pecl install redis \
RUN docker-php-ext-enable redis \
RUN pecl install apcu \
RUN docker-php-ext-enable apcu
