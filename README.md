# h-docker-env

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
