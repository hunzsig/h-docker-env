
FROM mongo:4.2

ENV ACCEPT_EULA=Y

RUN sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list && rm -Rf /var/lib/apt/lists/* && apt-get update

RUN apt-get -y install vim

# 镜像信息
LABEL Author="hunzsig"
LABEL Version="2020.03"
LABEL Description="mongo by hunzsig"