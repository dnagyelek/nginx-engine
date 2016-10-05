# install the main EasyEngine
wget -qO ee rt.cx/ee && sudo bash ee

# install nginx
sudo ee stack install --nginx

# install php5
sudo ee stack install --php

# install HipHop Machine
sudo ee stack install --hhvm

# install MariaDB
sudo ee stack install --mysql

# install WP-Cli
sudo ee stack install --wpcli

# install Redis
sudo ee stack install --redis
# sudo ee stack install --phpredisadmin

# install Admin Tools
# sudo ee stack install --admin
