#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade

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

# Duplicati
wget https://updates.duplicati.com/beta/duplicati_2.0.5.1-1_all.deb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
sudo apt-get update
sudo apt-get install mono-devel gtk-sharp2 libappindicator0.1-cil libappindicator1 libdbusmenu-glib4 libdbusmenu-gtk4 libindicator7 libmono-2.0-1 -y
sudo dpkg -i duplicati_2.0.5.1-1_all.deb

sudo printf '[Unit]
Description=Duplicati daemon and web-server
After=network.target

[Service]
Nice=19
IOSchedulingClass=idle
EnvironmentFile=-/etc/default/duplicati
ExecStart=/usr/bin/duplicati-server $DAEMON_OPTS
Restart=always

[Install]
WantedBy=multi-user.target' > /lib/systemd/system/duplicati.service

sudo service duplicati start
