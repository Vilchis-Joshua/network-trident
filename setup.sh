#!/bin/bash
mkdir -p {network, custom}
echo "Enter the number of WireGuard peers (default: 1):"
read WG_PEERS
# If empty, set to default value of 1
WG_PEERS=${WG_PEERS:-1}
# Validate that WG_PEERS is a positive integer
if ! [[ "$WG_PEERS" =~ ^[1-9][0-9]*$ ]]; then
    echo "Invalid number. Setting WG_PEERS to default value of 1."
    WG_PEERS=1
fi

touch .env
echo "WG_HOST=fqdn.com" >> .env 
# linode example
# echo "WG_HOST=your-linode-ip.ip.linodeusercontent.com" >> .env
echo "WG_PORT=51820" >> .env
echo "FTLCONF_webserver_api_password=$(openssl rand -base64 30 | tr -d '\n')" >> .env
echo 'WG_ALLOWED_IPS="0.0.0.0/0, ::/0"' >> .env
echo "DNS_SERVER=\"10.4.0.2#53\"" >> .env
echo "PIHOLE_IP=10.4.0.3" >> .env
echo "WG_IP=10.4.0.4" >> .env
echo "WG_INTERNAL_SUBNET=10.13.13.0/24" >> .env
echo "WG_PEERS=${WG_PEERS}" >> .env

docker prune -f