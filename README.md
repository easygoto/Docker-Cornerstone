# PHPer 专业环境

## 环境列表

- [x] nginx
- [x] mysql
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

## 存在问题

- [ ] pgsql 的 /var/lib/postgresql/data 目录映射不到 windows 主机, 原因是权限不能保持和容器的一致(postgres:700)
- [x] rabbitmq 的 /var/lib/rabbitmq/mnesia 是数据目录, 但容器重启的时候, 数据前缀会根据容器的不同而不同, 不能持久化在本地
    - [x] 通过添加 hostname 来解决这个问题
