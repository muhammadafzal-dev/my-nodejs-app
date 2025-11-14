#!/bin/bash
set -e

# Stop any running PM2 processes
/home/ubuntu/.nvm/versions/node/v18.17.1/bin/pm2 stop all || echo "PM2 is not running"

# Clean the deployment directory
if [ -d "/home/ubuntu/app-backend" ]; then
  echo "Cleaning old deployment..."
  sudo rm -rf /home/ubuntu/app-backend/*
fi
