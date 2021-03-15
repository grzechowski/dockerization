#!/bin/sh

cd /fixmename

composer install
composer dump-autoload

./artisan migrate:install

npm install
npm run dev

cd /docker
