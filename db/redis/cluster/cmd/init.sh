#!/usr/bin/env bash
echo 'cluster meet 172.63.11.102: ' && redis-cli -h 172.63.11.101 cluster meet 172.63.11.102 6379
echo 'cluster meet 172.63.11.103: ' && redis-cli -h 172.63.11.101 cluster meet 172.63.11.103 6379
echo 'cluster meet 172.63.11.104: ' && redis-cli -h 172.63.11.101 cluster meet 172.63.11.104 6379
echo 'cluster meet 172.63.11.105: ' && redis-cli -h 172.63.11.101 cluster meet 172.63.11.105 6379
echo 'cluster meet 172.63.11.106: ' && redis-cli -h 172.63.11.101 cluster meet 172.63.11.106 6379

# redis-cli -h 172.63.11.101 cluster nodes

# redis-cli -h 172.63.11.101 cluster addslots 0-5461
# redis-cli -h 172.63.11.102 cluster addslots 5462-10922
# redis-cli -h 172.63.11.103 cluster addslots 10923-16383
# redis-cli -h 172.63.11.101 cluster slots

for slot in `seq 0 5461` ; do
    echo "slot ${slot}:"
    redis-cli -h 172.63.11.101 cluster addslots "${slot}"
done

for slot in `seq 5462 10922` ; do
    echo "slot ${slot}:"
    redis-cli -h 172.63.11.102 cluster addslots "${slot}"
done

for slot in `seq 10923 16383` ; do
    echo "slot ${slot}:"
    redis-cli -h 172.63.11.103 cluster addslots "${slot}"
done

# redis-cli -h 172.63.11.104 cluster replicate f847c3d0be467a5795a21411d9ffe72ef8643da2
# redis-cli -h 172.63.11.105 cluster replicate f40e639b65ee2aa58074ed24f0bdf3dcb254c84a
# redis-cli -h 172.63.11.106 cluster replicate d138135547c621bc488e7b82f6ac0a13721b0cbc

redis-server
