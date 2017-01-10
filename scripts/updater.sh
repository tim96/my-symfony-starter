#!/bin/bash
# Path to bash interpreter

# Stop webserver or Show maintenance page or Add rule for redirect(In .htacces for example) while server was updated.

# Create backup (Using symfony bundle or mysqldump or another tool for example)

# Receive new files. At this moment it is git(It can be hg, svn and etc.).
git pull --force

# Update database schema
# Save migration query if you want using > migration_revision_datetime.sql and --dump-sql option
php app/console doctrine:schema:update --force --dump-sql

# Update composer
php composer.phar self-update
# Run composer with unlimited memory limit
# php -d memory_limit=-1 composer.phar update
php composer.phar update
php composer.phar dump-autoload --optimize

# Clear cache
php app/console cache:clear
php app/console cache:clear --env=prod --no-debug

# Install assets
php app/console assets:install web --symlink

# Install assetic if you want
# php app/console assetic:dump
# php app/console assetic:dump --env=prod --no-debug

# Start webserver or Hide maintenance page or Remove rule for redirect(In .htacces for example).

# Send emails for all responsible persons (Manager, Testers, Developer and etc).

# Check new features
