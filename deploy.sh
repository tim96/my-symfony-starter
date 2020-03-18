#!/bin/sh

# install vendors
composer install
composer dump-autoload --no-dev --classmap-authoritative

# apply migration
./bin/console doctrine:migrations:migrate --no-interaction
