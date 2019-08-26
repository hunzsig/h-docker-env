
FROM php:5.6-fpm

RUN apt-get update \
    && apt-get install iputils-ping \
    && docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# 镜像信息
LABEL Author="hunzsig"
LABEL Version="2019.8"
LABEL Description="docker-env"