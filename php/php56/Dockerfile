FROM php:5.6-fpm
COPY composer.phar /usr/bin/composer
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

RUN echo "deb http://mirrors.163.com/debian/ stretch main contrib non-free\ndeb http://mirrors.163.com/debian/ stretch-updates main contrib non-free\ndeb http://mirrors.163.com/debian/ stretch-backports main contrib non-free" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --allow-downgrades zlib1g=1:1.2.8.dfsg-5 zlib1g-dev libjpeg-dev libpng-dev zip unzip librabbitmq-dev
RUN docker-php-source extract
RUN cd /usr/src/php/ext/gd
RUN docker-php-ext-configure gd --with-jpeg-dir --with-png-dir
RUN docker-php-ext-install gd

# bcmath bz2 calendar ctype curl dba dom enchant exif ffi fileinfo filter ftp gd gettext gmp hash iconv imap intl json
# ldap mbstring mysqli oci8 odbc opcache pcntl pdo pdo_dblib pdo_firebird pdo_mysql pdo_oci pdo_odbc pdo_pgsql pdo_sqlite
# pgsql phar posix pspell readline reflection session shmop simplexml snmp soap sockets sodium spl standard sysvmsg sysvsem
# sysvshm tidy tokenizer xml xmlreader xmlrpc xmlwriter xsl zend_test zip
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install fileinfo
RUN docker-php-ext-install iconv
RUN docker-php-ext-install json
RUN docker-php-ext-install mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install session
RUN docker-php-ext-install sockets
RUN docker-php-ext-install zip

RUN pecl install redis-2.2.7.tgz
RUN pecl install xdebug-2.5.5.tgz
RUN pecl install mongodb-1.5.3.tgz
RUN pecl install swoole-2.0.11.tgz
RUN pecl install amqp-1.6.1.tgz
RUN pecl install memcache-3.0.8.tgz
RUN docker-php-ext-enable redis xdebug mongodb swoole amqp memcache
