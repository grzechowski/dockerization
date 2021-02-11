#!/bin/sh

cd /fixmename

composer install
composer dump-autoload

npm install
./artisan migrate:install

cd /docker
