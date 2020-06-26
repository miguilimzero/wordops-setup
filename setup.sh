#!/usr/bin/env bash
wget -qO wo wops.cc && sudo bash wo
sudo wo stack install
sudo wo stack install --ufw
sudo wo stack install --fail2ban
sudo wo stack install --sendmail

sudo apt-get install supervisor -y
service supervisor restart

sudo apt-get install cron -y
sudo systemctl enable cron
