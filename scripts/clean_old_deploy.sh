#!/bin/bash
set -e

# Stop any running PM2 processes
/home/ubuntu/.nvm/versions/node/v18.17.1/bin/pm2 stop all || echo "PM2 is not running"

# Clean the deployment directory by removing and recreating it
if [ -d "/home/ubuntu/app-backend" ]; then
  echo "Removing old deployment directory..."
  sudo rm -rf /home/ubuntu/app-backend
fi

echo "Creating new deployment directory..."
mkdir -p /home/ubuntu/app-backend
sudo chown ubuntu:ubuntu /home/ubuntu/app-backend
