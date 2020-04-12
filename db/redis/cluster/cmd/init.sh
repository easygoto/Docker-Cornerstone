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

redis-cli -h 172.63.11.104 cluster replicate bd60a9a827fa161623c67ec5743585687f52ec96
redis-cli -h 172.63.11.105 cluster replicate 6b22c154f7e6063f71446e6b1d4c50f4f9a195d2
redis-cli -h 172.63.11.106 cluster replicate 746dae0b9bd8b62ec3ef882457cd2cf2592b2063

redis-server
