#!/bin/sh

# running phpstan
./vendor/bin/phpstan analyse -l 7 -c phpstan.neon config src public

# running phpcs
./vendor/bin/phpcs --standard=PSR2 --ignore=src/Migrations/*,config/bootstrap.php config src

# running doctrine commands
# ./bin/console doctrine:migrations:status
# ./bin/console doctrine:schema:validate

# running phpmetrics report
# ./vendor/bin/phpmetrics --report-html=myreport .

# running phpmd report
# ./vendor/bin/phpmd src xml cleandcode
# There src - code folder for scan, xml - format, cleancode - ruleset
# Available formats: ansi, html, json, text, xml.
# Available rulesets: cleancode, codesize, controversial, design, naming, unusedcode.
