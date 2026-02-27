#!/bin/bash

# 1. Start Tailscale daemon in userspace mode
tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &
sleep 5

# 2. Authenticate and bring up the node
# We use SALAD_MACHINE_ID as the hostname to identify nodes easily
tailscale up --auth-key=$TAILSCALE_AUTH_KEY --hostname=${SALAD_MACHINE_ID:-salad-node} --accept-dns=false
sleep 5

# 3. Optional: Enable Tailscale SSH for easy access
tailscale set --ssh

# 4. Start your actual application
# Example: python my_app.py
sleep infinity
