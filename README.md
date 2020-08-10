# Ingress for MetaKGP

This is the entrypoint NGINX server for the MetaKGP DO server.

This proxy_passes to iqps, static and wiki.

Currently this relies on system ports, but we will soon move to Docker networks.

## Setup

As a root run:

```bash

docker build --tag ingress .

docker run --name metakgp-ingress --network="host" -d ingress
```

This will make the ingress server listen on port 80.

It assumes that:

- IQPS is listening on port 8001.
- MetaKGP-Wiki is listening on port 8002.

Both on the host network.
If that is not the case, please change them accordingly in
IQPS's `docker-compose.yml` and
wiki's `.env` variable `SERVER_PORT`.


## Firewall Script

`firewall.sh` sets the `ufw` firewall in DO to accept only ports 22, 80 and 443.

Run it with sudo or as root.

## Local Testing

In a Linux system, you need to override the default DNS resolution to test this.

To do that, using sudo open `/etc/hosts`.

Then change the line that starts with `127.0.0.1    localhost` (usually the first line)
to:

```
127.0.0.1   localhost static.metakgp.org wiki.metakgp.org iqps.metakgp.org
```
Then save the file.

Now all the above newly added sites point to `127.0.0.1` (which is you).
At this point, you cannot visit the actual sites in a browser.
However, if you start wiki, iqps and ingress with the configurations mentioned in the Setup section,
all requests to these sites will be pointed to Ingress.

After testing, be sure to remove/comment out these extra site names (keep `localhost` intact though).
Otherwise the original sites will not work in your computer.

