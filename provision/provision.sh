# to run after vagrant up

sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove

vagrant box update

# install the main EasyEngine
wget -qO ee rt.cx/ee && sudo bash ee

# install nginx
sudo ee stack install --nginx

# install / remove php5
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

# remove Postfix
sudo ee stack purge --postfix
sudo ee stack remove --postfix

# install Admin Tools
# sudo ee stack install --admin

# install phpmyadmin
sudo ee stack install --phpmyadmin

sudo ee site create drigg.box --wpsubdir --wpredis --php7

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

server {
       listen         80;
       server_name    devly.co www.devly.co;
       return         301 https://$server_name$request_uri;
}


server {
        listen 443 ssl http2;
        server_name devly.co www.devly.co;

        ssl on;
        ssl_certificate /etc/nginx/cert/devly.co.crt;
        ssl_certificate_key /etc/nginx/cert/devly.co.key;
        access_log   /var/log/nginx/devly.co.access.log rt_cache;
        error_log    /var/log/nginx/devly.co.error.log;
        root /var/www/devly.co/htdocs;
        index index.php index.htm index.html;

        include common/wpfc.conf;
        include common/wpcommon.conf;
        include common/locations.conf;

}

install gulp locally
 npm install gulp