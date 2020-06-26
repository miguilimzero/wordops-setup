#!/usr/bin/env bash
wget -qO wo wops.cc && sudo bash wo
sudo wo stack install
sudo wo stack install --ufw
sudo wo stack install --fail2ban
sudo wo stack install --sendmail

apt-get install supervisor
service supervisor restart

sudo apt install cron
sudo systemctl enable cron
