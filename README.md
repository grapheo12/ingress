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

