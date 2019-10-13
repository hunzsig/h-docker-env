
FROM php:7.1-fpm

ENV ACCEPT_EULA=Y

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && rm -Rf /var/lib/apt/lists/* && apt-get update

RUN apt-get -y install \
    apt-utils \
    default-libmysqlclient-dev \
    libbz2-dev \
    libsasl2-dev \
    libssl-dev \
    curl \
    git \
    libfreetype6-dev \
    libicu-dev \
    libjpeg-dev \
    libmcrypt-dev \
    libpng-dev \
    libpq-dev \
    libc-client-dev \
    libxml2-dev \
    libsqlite3-dev \
    librabbitmq-dev


RUN docker-php-ext-install bz2
RUN docker-php-ext-install bcmath
RUN docker-php-ext-install gd
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install sockets
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pdo_sqlite
RUN docker-php-ext-install zip

RUN pecl install http://pecl.php.net/get/igbinary-3.0.1.tgz
RUN pecl install http://pecl.php.net/get/redis-5.0.2.tgz
RUN pecl install http://pecl.php.net/get/LZF-1.6.7.tgz
RUN pecl install http://pecl.php.net/get/mongodb-1.6.0RC1.tgz
RUN pecl install http://pecl.php.net/get/amqp-1.9.4.tgz
RUN pecl install http://pecl.php.net/get/swoole-4.4.5.tgz

RUN docker-php-ext-enable \
    bz2 bcmath gd xmlrpc sockets mysqli pgsql pdo_mysql pdo_pgsql pdo_sqlite zip \
    igbinary redis lzf mongodb amqp swoole

# 镜像信息
LABEL Author="hunzsig"
LABEL Version="2019.9"
LABEL Description="php71 by hunzsig"