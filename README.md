# PHPer 集群/分布式环境

## 环境架构

```
http://php5host
http://php7host

<root>
 |-- db
   |-- mysql
     |-- master: 主数据库, 写数据库
     |-- slave: 从数据库, 读数据库
   |-- redis
     |-- node1: 一个非持久化主库, 两个持久化从库, 三个哨兵
 |-- gateway: 网关服务器, 均衡分发同业务服务器(集群), 反向代理不同业务服务器(分布式)
 |-- logs: 各种日志文件
 |-- server: 服务器群
   |-- system5_1: php-xdebug 版, 模拟单独的服务器, 有自己的环境和项目
   |-- system5_2: php-swoole 版, 后续改为不需要 nginx
   |-- system7_1: php-xdebug 版, 模拟单独的服务器, 有自己的环境和项目
   |-- system7_2: php-swoole 版, 后续改为不需要 nginx
```

## 子网分配

gateway: 172.63.0.2
mysql: 172.63.1.*
redis: 172.63.11.* - 172.63.20.*
system: 172.63.201.* - 172.63.240.*

## 环境介绍

- [x] 环境变量已经提取到 .env.example 中, 使用时改名为 .env, 根据自己的环境适配变量
- [x] 当前窗口打开命令行, 使用 `.\run.bat up -d` 部署环境, `.\run.bat re` 重启环境
- [x] 聚合各种各样/乱七八糟的 PHP 环境
- [x] nginx 负载均衡/反向代理
- [x] mysql 主从复制/读写分离
- [ ] mongodb 的应用
- [x] redis 主从同步(从库报设备繁忙的错误, 是因为从库的 data 映射到 windows 的原因)
- [x] redis 哨兵(主库若断开, 所有的配置文件都会改变)
- [ ] memcached 分布式环境

## 经验积累

- 主从复制会降低数据库的读写效率, 经本地测试计时得, 会降低 40% - 60%
- 主从复制中, 将主数据库的索引去掉, 保留从数据库的索引能稍微些许提高效率
