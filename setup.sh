#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get upgrade -y

wget -qO wo wops.cc && sudo bash wo
sudo wo stack install
sudo wo stack install --ufw
sudo wo stack install --fail2ban
sudo wo stack install --sendmail

# Install gmp extension
sudo apt-get install php7.4-gmp

# Install node.js 10.x
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

sudo apt-get install -y nodejs
sudo apt-get install -y gcc g++ make

# Supervisor
sudo apt-get install supervisor -y
sudo service supervisor restart

# Dropbox
sudo mkdir /root/dropbox/
sudo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /root/dropbox/dropbox_uploader.sh

# Config
sudo ufw allow 22,80,443/tcp
sudo ufw allow 22222
sudo ufw enable
