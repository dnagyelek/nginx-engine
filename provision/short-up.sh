#!/usr/bin/env bash

sudo apt-get update && sudo apt-get upgrade
sudo apt-get autoremove

wget -qO ee rt.cx/ee && sudo bash ee

sudo ee stack install --nginx --php7 --mysql --wpcli --phpmyadmin

sudo curl -sS https://getcomposer.org/installer | sudo php -- --filename=composer --install-dir=/usr/local/bin

cd /var/www/22222/htdocs/db/pma
sudo composer install --no-dev
sudo chown www-data: * -R

sudo nano /etc/ee/ee.conf
-->
[mysql]
db-name = true
db-user = False

[wordpress]
prefix = true
user = adm
password =
email =
<--

sudo ee site create xxxxx.box --wp --php7

npm install -g gulp
npm install --save-dev gulp
npm install browser-sync gulp --save-dev

sudo openssl genrsa -out "/etc/ssl/xxxxx.box.key" 2048
sudo openssl req -new -key "/etc/ssl/xxxxx.box.key" -out "/etc/ssl/xxxxx.box.csr"
sudo openssl x509 -req -days 2048 -in "/etc/ssl/xxxxx.box.csr"  -signkey "/etc/ssl/xxxxx.box.key" -out "/etc/ssl/xxxxx.box.crt"

sudo ee site edit xxxxx.box
-->
server {
       listen         80;
       server_name    xxxxx.box www.xxxxx.box;
       return         301 https://$server_name$request_uri;
}

server {

        listen 443;
        server_name xxxxx.box   www.xxxxx.box;

        ssl on;
        ssl_certificate /etc/ssl/xxxxx.box.crt;
        ssl_certificate_key /etc/ssl/xxxxx.box.key;
<--





