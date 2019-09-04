# docker-openvpn
Scripts for run OpenVPN with docker

Switch to branch `2fa` to use OpenVPN with two-factor auth.

# Install

## Step 1: Generate server's config

`init-server.sh`

## Step 2: Create a user

It creates OpenVPN config for user and generates two-factor auth code

`create-user.sh <username>`
