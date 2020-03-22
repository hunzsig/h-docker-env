
FROM php:7.2-fpm

ENV ACCEPT_EULA=Y

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list
RUN rm -Rf /var/lib/apt/lists/*
RUN apt-get update

RUN apt-get -y install apt-utils
RUN apt-get -y install default-libmysqlclient-dev
RUN apt-get -y install libbz2-dev
RUN apt-get -y install libsasl2-dev
RUN apt-get -y install libssl-dev
RUN apt-get -y install curl
RUN apt-get -y install git
RUN apt-get -y install libfreetype6-dev
RUN apt-get -y install libicu-dev
RUN apt-get -y install libjpeg-dev
RUN apt-get -y install libmcrypt-dev
RUN apt-get -y install libpng-dev
RUN apt-get -y install libpq-dev
RUN apt-get -y install libc-client-dev
RUN apt-get -y install libxml2-dev
RUN apt-get -y install libsqlite3-dev
RUN apt-get -y install librabbitmq-dev
RUN apt-get -y install librdkafka-dev


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

RUN pecl install http://pecl.php.net/get/igbinary-3.1.2.tgz
RUN pecl install http://pecl.php.net/get/redis-5.2.1.tgz
RUN pecl install http://pecl.php.net/get/LZF-1.6.7.tgz
RUN pecl install http://pecl.php.net/get/mongodb-1.7.4.tgz
RUN pecl install http://pecl.php.net/get/amqp-1.9.4.tgz
RUN pecl install http://pecl.php.net/get/swoole-4.4.16.tgz
RUN pecl install http://pecl.php.net/get/rdkafka-4.0.3.tgz

RUN docker-php-ext-enable bz2 bcmath gd xmlrpc sockets mysqli pgsql pdo_mysql pdo_pgsql pdo_sqlite zip
RUN docker-php-ext-enable igbinary redis lzf mongodb amqp swoole rdkafka

# 镜像信息
LABEL Author="hunzsig"
LABEL Version="2020.03"
LABEL Description="php72 by hunzsig"