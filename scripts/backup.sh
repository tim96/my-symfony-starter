#!/bin/bash
# Path to bash interpreter

# Create backup for project using DizdaCloudBackupBundle
php app/console dizda:backup:start --env=prod
