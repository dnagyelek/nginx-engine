# to run after vagrant up

sudo apt-get update

sudo apt-get upgrade

sudo apt-get autoremove

# install the main EasyEngine
wget -qO ee rt.cx/ee && sudo bash ee

# install nginx
sudo ee stack install --nginx

# install php5
sudo ee stack install --php
sudo ee stack purge --php
sudo ee stack remove --php

# install php7
sudo ee stack install --php7

# install HipHop Machine
sudo ee stack install --hhvm

# install MariaDB
sudo ee stack install --mysql

# install WP-Cli
sudo ee stack install --wpcli

# install Redis
sudo ee stack install --redis
# sudo ee stack install --phpredisadmin



Postfix
sudo ee stack purge --postfix
sudo ee stack remove --postfix

# install Admin Tools
# sudo ee stack install --admin

# install phpmyadmin
sudo ee stack install --phpmyadmin

SSL

sudo openssl genrsa -out "/etc/ssl/drigg.box.key" 2048
sudo openssl req -new -key "/etc/ssl/drigg.box.key" -out "/etc/ssl/drigg.box.csr"

sudo openssl x509 -req -days 2048 \
    -in "/etc/ssl/drigg.box.csr" \
    -signkey "/etc/ssl/drigg.box.key" \
    -out "/etc/ssl/drigg.box.crt"

ssl_certificate /etc/ssl/drigg.box.crt;
ssl_certificate_key /etc/ssl/drigg.box.key;

ex - > https://serversforhackers.com/video/self-signed-ssl-certificates-for-development