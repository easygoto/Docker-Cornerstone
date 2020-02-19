@set deployCmd=docker-compose ^
   -f deploy-gateway.yml ^
   -f deploy-mysql.yml ^
   -f deploy-memcached.yml ^
   -f deploy-redis.yml ^
   -f deploy-php56.yml ^
   -f deploy-php73.yml ^
   -f deploy-php74.yml

@if "%1" == "" (
    @%deployCmd% start
) else (
    @if "%1" == "re" (
        @%deployCmd% restart %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        @%deployCmd% %*
    )
)
