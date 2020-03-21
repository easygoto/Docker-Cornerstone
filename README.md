# PHPer 集群/分布式环境

## 环境架构

```
http://php56host
http://php74host

<root>
 |-- db
   |-- mysql
     |-- master: 主数据库, 写数据库
     |-- slave: 从数据库, 读数据库
   |-- redis
     |-- master: 主库, 开启 aof, 关闭 rdb
     |-- slave1: 从库1, 关闭 aof, 开启 rdb
     |-- slave2: 从库2, 关闭 aof, 关闭 rdb
 |-- gateway: 网关服务器, 均衡分发同业务服务器(集群), 反向代理不同业务服务器(分布式)
 |-- logs: 各种日志文件
 |-- server: 服务器群
   |-- system56_1: php-xdebug 版, 模拟单独的服务器, 有自己的环境和项目
   |-- system56_2: php-swoole 版
   |-- system74_1: php-xdebug 版, 模拟单独的服务器, 有自己的环境和项目
   |-- system74_2: php-swoole 版
```

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
