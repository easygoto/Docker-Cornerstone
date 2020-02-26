@set deployCmd=docker-compose ^
   -f deploy-gateway.yml ^
   -f deploy-nginx.yml ^
   -f deploy-php.yml ^
   -f deploy-mysql.yml ^
   -f deploy-redis.yml ^
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
