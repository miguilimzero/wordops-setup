# wordops-setup

Execute Setup (WordOps will ask you some informations about Git and Dropbox will ask you an access token):

```sh
wget -qO wos https://raw.githubusercontent.com/srdante/wordops-setup/master/setup.sh && sudo bash wos
```

Reset username and password after setup:

```sh
wo secure --auth
```

Setup Cloudflare keys to validate SSL:

```sh
export CF_Key=""
export CF_Email=""
```

Create website with Cloudflare SSL `(Domain must already be pointed to IP before executing this command)`:

```sh
sudo wo site create site.tld --php74 --mysql --letsencrypt=wildcard --dns=dns_cf
```
