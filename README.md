# h-docker-env

涵盖
```
php（5.6 - 7.3）
    bz2 bcmath gd xmlrpc sockets mysqli pgsql 
    pdo_mysql pdo_pgsql pdo_sqlite igbinary redis 
    lzf mongo mongodb amqp swoole

nginx（latest）

redis（latest）

rabbitmq（3.8-rc-management）

mysql（8.0）
    master-slave

pgsql（10.10）
    pgadmin4
    
mongo（4.2）
    master-slave

elasticsearch（6.8.3）
    kibana（6.8.3）
    apm-server（6.8.3）
```

流程
```
docker-compose build
docker-compose up
```


mysql主从
 * master
```
# 连接进入 master
# 创建一个用于同步的账号
    CREATE USER repl IDENTIFIED BY 'hunzsig';
    GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
    FLUSH PRIVILEGES;
# 锁表搞事
    FLUSH TABLES WITH READ LOCK;
# 获取二进制日志的信息
    SHOW MASTER STATUS;
# 记住 FILE / POSITION，如：
#   mysql-bin.000034 / 1864
# 解锁表
    UNLOCK TABLES;
```
 * slave
```
# 连接进入 slave  
    CHANGE MASTER TO
        MASTER_HOST='172.19.0.10',
        MASTER_USER='repl',
        MASTER_PASSWORD='hunzsig',
        MASTER_LOG_FILE='mysql-bin.000034',
        MASTER_LOG_POS=1864;
# 开启
    START SLAVE;
    SHOW SLAVE STATUS;
```
