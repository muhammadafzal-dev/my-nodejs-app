#!/bin/bash
set -e

echo ">>> Fixing permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

# create backup folder
mkdir -p /home/ubuntu/app-backend-backup

# backup .env
if [ -f /home/ubuntu/app-backend/.env ]; then
  cp /home/ubuntu/app-backend/.env /home/ubuntu/app-backend-backup/.env
fi

# backup ecosystem config
if [ -f /home/ubuntu/app-backend/ecosystem.config.js ]; then
  cp /home/ubuntu/app-backend/ecosystem.config.js /home/ubuntu/app-backend-backup/
fi
