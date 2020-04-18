# 部署集群
redis-cli --cluster create 172.63.11.101:6379 172.63.11.102:6379 172.63.11.103:6379 172.63.11.104:6379 172.63.11.105:6379 172.63.11.106:6379 --cluster-replicas 1

# 查看节点
redis-cli -h 172.63.11.101 cluster nodes

# 查看分配槽
redis-cli -h 172.63.11.101 cluster slots

# 增加节点分配数据槽
redis-cli --cluster add-node 172.63.11.107:6379 172.63.11.101:6379
redis-cli --cluster reshard 172.63.11.101:6379
# 分配多少数据槽: 按量计算
# 接收数据的 nodeId: 107_nodeId
# 源节点: all 从所有服务器平均迁移分配, done 从某服务器迁移分配

# 增加节点分配为从节点
redis-cli --cluster add-node 172.63.11.108:6379 172.63.11.101:6379
redis-cli -h 172.63.11.108 cluster replicate 172.63.11.107_nodeId

# 删除从节点
redis-cli --cluster del-node 172.63.11.108:6379 108_nodeId

# 删除主节点分配数据槽
redis-cli --cluster reshard 172.63.11.107:6379
# 分配多少数据槽: 全部奉还
# 接收数据的 nodeId: 101_nodeId
# 源节点: 107_nodeId
# 源节点: done
redis-cli --cluster del-node 172.63.11.107:6379 107_nodeId

# 读写分离(从节点执行 readonly)
redis-cli -h 172.63.11.102 readonly
