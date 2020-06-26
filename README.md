# wordops-setup

Reset username and password after setup:

```sh
wo secure --auth
```

Setup cloudflare keys to validate SSL:

```sh
export CF_Key=""
export CF_Email=""
```

Create website with cloudflare SSL `(Domain must already be pointed to IP before executing this command)`:

```sh
sudo wo site create site.tld --php74 --mysql --letsencrypt=wildcard --dns=dns_cf
```
