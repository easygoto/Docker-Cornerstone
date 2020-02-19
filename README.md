# PHPER 专业环境

## 环境列表

- [x] nginx
- [x] mysql
- [x] mongodb
- [x] redis
- [x] memcached
- [x] rabbitmq
- [x] php5.6 +xdebug +redis +memcache +mongodb +amqp
- [x] php5.6 +swoole +redis +memcache +mongodb +amqp
- [x] php7.3 +xdebug +redis +memcache +mongodb +amqp
- [x] php7.3 +swoole +redis +memcache +mongodb +amqp
- [x] php7.4 +xdebug +redis +memcache +mongodb
- [x] php7.4 +swoole +redis +memcache +mongodb

## 环境介绍

- 环境变量已经提取到 .env.example 中, 使用时改名为 .env, 根据自己的环境适配变量
- 当前窗口打开命令行, 使用 `.\run.bat up -d` 部署环境, `.\run.bat re` 重启环境
- 有少许项目不支持 PHP7, 所以保留了 PHP5
- swoole 和 xdebug 共存会报致命错误, 所以每个版本都分 xdebug 版和 swoole 版
- PHP7.4 的 amqp 扩展没有发布, 所以 7.4 暂时不支持 rabbitmq
