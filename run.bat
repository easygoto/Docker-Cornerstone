@set deployCmd=docker-compose ^
   -f deploy-network.yml ^
   -f deploy-gateway.yml ^
   -f deploy-system5-1.yml ^
   -f deploy-system5-2.yml ^
   -f deploy-system7-1.yml ^
   -f deploy-system7-2.yml ^
   -f deploy-mysql.yml ^
   -f deploy-redis-sentinel.yml ^
   -f deploy-redis-cluster.yml ^
   -f deploy-memcached.yml

@if "%1" == "" (
    @%deployCmd% start
) else (
    @if "%1" == "re" (
        @%deployCmd% restart %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        @%deployCmd% %*
    )
)
