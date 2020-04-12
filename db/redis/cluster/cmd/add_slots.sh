# redis-cli -h 172.63.11.101 cluster addslots 0-5461
# redis-cli -h 172.63.11.102 cluster addslots 5462-10922
# redis-cli -h 172.63.11.103 cluster addslots 10923-16383

host=$1
start=$2
end=$3
for slot in `seq ${start} ${end}` ; do
    echo "slot ${slot}:"
    redis-cli -h "${host}" cluster addslots "${slot}"
done
