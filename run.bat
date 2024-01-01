@set deployCmd=docker-compose ^
   -f deploy-common.yml ^
   -f deploy-server.yml ^
   -f deploy-ui.yml ^
   -f deploy-php.yml

@if "%1" == "" (
    @%deployCmd% start
) else (
    @if "%1" == "re" (
        @%deployCmd% restart %2 %3 %4 %5 %6 %7 %8 %9
    ) else (
        @%deployCmd% %*
    )
)
