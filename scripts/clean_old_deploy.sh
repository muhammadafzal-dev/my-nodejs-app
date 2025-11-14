#!/bin/bash
set -e

echo ">>> Fixing permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Moving to app directory"
cd /home/ubuntu/app-backend

# create backup folder
mkdir -p /home/ubuntu/app-backend-backup

# backup .env
if [ -f .env ]; then
  cp .env /home/ubuntu/app-backend-backup/.env
fi

# backup ecosystem config
if [ -f ecosystem.config.js ]; then
  cp ecosystem.config.js /home/ubuntu/app-backend-backup/
fi
