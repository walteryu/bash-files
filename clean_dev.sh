#!/bin/bash

# clean/update dev files
rvm get stable --auto-dotfiles
rvm cleanup all
rvm reload
sudo rvm osx-ssl-certs cron install

sudo port selfupdate
sudo port upgrade outdated

npm install -g npm-check-updates; ncu -u; npm update; npm install

bundle install
bundle; bundle update
bundle exec rake db:migrate db:rollback && rake db:migrate
gem update --system

composer update
composer install
composer dump-autoload
