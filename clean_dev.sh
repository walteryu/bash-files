#!/bin/bash

# clean/update dev files
echo "==> Running rvm get stable"
rvm get stable --auto-dotfiles
echo "==> Running rvm cleanup all"
rvm cleanup all
echo "==> Running rvm reload"
rvm reload

echo "==> Running port selfupdate"
sudo port selfupdate
echo "==> Running port upgrade"
sudo port upgrade outdated

echo "==> Running npm-check-updates"
npm install -g npm-check-updates; ncu -u
echo "==> Running npm update"
npm update
echo "==> Running npm install"
npm install

echo "==> Running bundle install"
bundle install
echo "==> Running bundle update"
bundle; bundle update
echo "==> Running killall chrome"
bundle exec rake db:migrate db:rollback && rake db:migrate

echo "==> Running killall chrome"
gem update --system

echo "==> Running killall chrome"
composer update
echo "==> Running killall chrome"
composer install
echo "==> Running killall chrome"
composer dump-autoload
