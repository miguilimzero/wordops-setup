#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get upgrade -y

wget -qO wo wops.cc && sudo bash wo
sudo wo stack install
sudo wo stack install --ufw
sudo wo stack install --fail2ban
sudo wo stack install --sendmail

# Config
sudo ufw allow 22,80,443,22222/tcp
sudo ufw enable

# Supervisor
sudo apt-get install supervisor -y
sudo service supervisor restart

# Cron
sudo apt-get install cron -y
sudo systemctl enable cron

# Dropbox
sudo mkdir /root/dropbox/
sudo curl "https://raw.githubusercontent.com/andreafabrizi/Dropbox-Uploader/master/dropbox_uploader.sh" -o /root/dropbox/dropbox_uploader.sh
