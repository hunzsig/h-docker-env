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

```

流程
```
docker-compose build
docker-compose up
```

mysql主从
```
# 连接进入 master
# 创建一个用于同步的账号
    CREATE USER repl IDENTIFIED BY 'hunzsig';
    GRANT REPLICATION SLAVE ON *.* TO 'repl'@'%';
    FLUSH PRIVILEGES;
# 锁表搞事
# 获取二进制日志的信息
    FLUSH TABLES WITH READ LOCK;
    SHOW MASTER STATUS;
# 记住 FILE / POSITION，如：
#   mysql-bin.000034 / 1864
# 解锁表
    UNLOCK TABLES;
# 连接进入 slave  
    CHANGE MASTER TO
        MASTER_HOST='172.19.0.20',
        MASTER_PORT=3306,
        MASTER_USER='repl',
        MASTER_PASSWORD='hunzsig',
        MASTER_LOG_FILE='mysql-bin.000034',
        MASTER_LOG_POS=1864;
# 开启
    START SLAVE;
    SHOW SLAVE STATUS;
```

mongo集群
```
连接三个节点中的任意一个：mongo -u hunzsig -p 123456
rs.initiate({
  _id:"rs",
  members:[
    {_id:0,host:"172.19.0.41:27017"},
    {_id:1,host:"172.19.0.42:27017"},
    {_id:2,host:"172.19.0.43:27017"}
]})
然后就可以创建你的项目数据库和它的管理员
use mydb
db.createUser( {user: "hunzsig",pwd: "123456",roles: [ { role: "readWrite", db: "mydb" } ]})
```

mongo创建数据库
```

```