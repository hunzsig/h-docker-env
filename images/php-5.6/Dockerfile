
FROM php:5.6-fpm

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
RUN docker-php-ext-install gd
RUN docker-php-ext-install xmlrpc
RUN docker-php-ext-install sockets
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-install pdo_sqlite

RUN pecl install igbinary
RUN pecl install redis
RUN pecl install lzf
RUN pecl install mongo
RUN pecl install mongodb
RUN pecl install amqp
RUN pecl install swoole

RUN docker-php-ext-enable \
    bz2 gd xmlrpc sockets mysqli pgsql pdo_mysql pdo_pgsql pdo_sqlite \
    igbinary redis lzf mongo mongodb amqp swoole

# 镜像信息
LABEL Author="hunzsig"
LABEL Version="2019.8"
LABEL Description="php56 by hunzsig"