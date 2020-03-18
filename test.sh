#!/bin/sh

# running phpstan
./vendor/bin/phpstan analyse -l 7 -c phpstan.neon config src public

# running phpcs
./vendor/bin/phpcs --standard=PSR2 --ignore=src/Migrations/*,config/bootstrap.php config src

# running doctrine commands
# ./bin/console doctrine:migrations:status
# ./bin/console doctrine:schema:validate
