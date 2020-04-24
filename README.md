# PHPer 专业环境

## 环境列表

- [x] nginx
- [x] mysql +sysbench
- [x] postgresql
- [x] mongodb
- [x] redis
- [x] memcached
- [x] rabbitmq
- [x] php5.6 +redis +memcache +memcached +mongodb +amqp +imagick +apcu
    - [x] php5.6 +xdebug
    - [x] php5.6 +swoole
- [x] php7.4 +redis +memcache +memcached +mongodb +amqp +imagick +apcu +yaml +yaf +psr
    - [x] php7.4 +xdebug +phalcon
    - [x] php7.4 +swoole +swoole_async +swoole_postgresql +swoole_orm

## 环境介绍

- 环境变量已经提取到 .env.example 中, 使用时改名为 .env, 根据自己的环境适配变量
- 当前窗口打开命令行, 使用 `.\run.bat up -d` 部署环境, `.\run.bat re` 重启环境
- 有少许项目不支持 PHP7, 所以保留了 PHP5
- swoole 和 xdebug 共存会报致命错误, 所以每个版本都分 xdebug 版和 swoole 版

## mysql

### sysbench

> /usr/local/share/sysbench/ 下还有很多 lua 脚本

```
# 准备数据
sysbench /usr/local/share/sysbench/oltp_read_write.lua --tables=10 --table_size=500000 --mysql-user=root --mysql-password=123123 --mysql-db=sbtest --threads=4 prepare
# 执行测试
sysbench /usr/local/share/sysbench/oltp_point_select.lua --tables=10 --table_size=500000 --mysql-user=root --mysql-password=123123 --mysql-db=sbtest --threads=4 --time=60 --report-interval=10 run
# 清理数据
sysbench /usr/local/share/sysbench/oltp_read_write.lua --tables=10 --table_size=500000 --mysql-user=root --mysql-password=123123 --mysql-db=sbtest cleanup
```

### mysqldumpslow

```
-s: 排序方式. 默认at
    al: average lock time 平均锁定时间
    ar: average rows sent 平均返回行数
    at: average query time 平均查询时间
c: count 总执行次数
l: lock time 总锁定时间
r: rows sent 总返回行数
t: query time 总查询时间
-t: show the top n queries, 显示前多少名的记录
-a: 默认不开启. 值为绑定值 N, 若开启, 显示真实值
-g: 类似于 grep 命令, 过滤出需要的信息
-l: 总时间中包含锁定时间

# 例
mysqldumpslow -s c -t 10 /var/lib/mysql/slow.log
mysqldumpslow -s t -t 10 -g "left join" /var/lib/mysql/slow.log
mysqldumpslow -s r -t 20 /var/lib/mysql/slow.log | more # 结合 | 和 more 使用, 否则可能出现刷屏的情况
```

## 存在问题

- [x] mongodb 的 /data 目录映射不到 windows 主机, 原因是 windows 下没有兼容
    - [x] 使用卷解决问题
- [x] pgsql 的 /var/lib/postgresql/data 目录映射不到 windows 主机, 原因是权限不能保持和容器的一致(postgres:700)
    - [x] 使用卷解决问题
- [x] rabbitmq 的 /var/lib/rabbitmq/mnesia 是数据目录, 但容器重启的时候, 数据前缀会根据容器的不同而不同, 不能持久化在本地
    - [x] 通过添加 hostname 来解决这个问题
    - [x] 本地环境不建议在本地映射数据目录, 因为每次启动都会检查数据, 服务启动慢
    - [x] 数据保存在本地后, 启动不稳定
    - [x] 使用卷解决问题
