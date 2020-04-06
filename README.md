# PHPer 专业环境

## 环境列表

- [x] nginx
- [x] mysql
- [x] postgresql
- [x] mongodb
- [x] redis
- [x] memcached
- [x] rabbitmq
- [x] php5.6 +xdebug +redis +memcache +memcached +mongodb +amqp +imagick +apcu
- [x] php5.6 +swoole +redis +memcache +memcached +mongodb +amqp +imagick +apcu
- [x] php7.4 +xdebug +redis +memcache +memcached +mongodb +amqp +imagick +apcu +yaml
- [x] php7.4 +swoole +swoole_async +swoole_postgresql +swoole_orm +swoole_serialize +redis +memcache +memcached +mongodb +amqp +imagick +apcu +yaml

## 环境介绍

- 环境变量已经提取到 .env.example 中, 使用时改名为 .env, 根据自己的环境适配变量
- 当前窗口打开命令行, 使用 `.\run.bat up -d` 部署环境, `.\run.bat re` 重启环境
- 有少许项目不支持 PHP7, 所以保留了 PHP5
- swoole 和 xdebug 共存会报致命错误, 所以每个版本都分 xdebug 版和 swoole 版

## 存在问题

- [ ] pgsql 的 /var/lib/postgresql/data 目录映射不到 windows 主机, 原因是权限不能保持和容器的一致(postgres:700)
