#!/bin/bash
set -e

echo ">>> Fixing permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Moving to app directory"
cd /home/ubuntu

# create backup folder for env and pm2 logs
mkdir -p app-backend-backup

if [ -f app-backend/.env ]; then
  cp app-backend/.env app-backend-backup/.env
fi

if [ -f app-backend/ecosystem.config.js ]; then
  cp app-backend/ecosystem.config.js app-backend-backup/
fi


