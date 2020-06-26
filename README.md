# WordOps Setup
This project is an automated script to install WordOps and deploy a web server faster. It also adds a dropbox script since wordops has no backup method.

Wordops Documentation: https://docs.wordops.net/getting-started/prerequesites/

### WordOps Installs

 - Base Stack
 - Ufw Stack
 - Fail2ban Stack
 - Sendmail Stack
 
### Other Installs

 - Node.js 10.x
 - Supervisor
 - Dropbox Script

### Setup Guide

Execute script `(WordOps will ask you some informations about Git and Ufw will ask for firewall rule confirmation)`:

```sh
wget -qO wos https://raw.githubusercontent.com/srdante/wordops-setup/master/setup.sh && sudo bash wos
```

Reset WordOps username and password after setup:

```sh
wo secure --auth
```

### Cloudflare Guide

Setup Cloudflare keys to validate SSL:

```sh
export CF_Key=""
export CF_Email=""
```

Create website with Cloudflare SSL `(Domain must already be pointed to IP before executing this command)`:

```sh
wo site create example.com --php74 --mysql --letsencrypt=wildcard --dns=dns_cf
```

### Dropbox Guide

Setup Dropbox access token:

```sh
bash /root/dropbox/dropbox_uploader.sh
```

Database backup Cron example:

```sh
0 * * * * cd /root/dropbox/ && mysqldump wordpress > wordpress-$(date +%Y-%m-%d-%H-00-00).sql && bash dropbox_uploader.sh upload wordpress-$(date +%Y-%m-%d-%H-00-00).sql /wordpress
```

### Permission Guide

Common permission commands to fix files permission `(Laravel folders)`

```sh
sudo chown -R $USER:www-data storage
sudo chown -R $USER:www-data bootstrap/cache
```
