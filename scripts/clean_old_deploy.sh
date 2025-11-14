#!/bin/bash
set -e

# Stop any running PM2 processes
/home/ubuntu/.nvm/versions/node/v18.17.1/bin/pm2 stop all || echo "PM2 is not running"

# Create a backup directory
mkdir -p /home/ubuntu/app-backend-backup

# Back up the .env file before cleaning the directory
if [ -f "/home/ubuntu/app-backend/.env" ]; then
  echo "Backing up .env file..."
  cp /home/ubuntu/app-backend/.env /home/ubuntu/app-backend-backup/.env
fi

# Clean the deployment directory by removing and recreating it
if [ -d "/home/ubuntu/app-backend" ]; then
  echo "Removing old deployment directory..."
  sudo rm -rf /home/ubuntu/app-backend
fi

echo "Creating new deployment directory..."
mkdir -p /home/ubuntu/app-backend
sudo chown ubuntu:ubuntu /home/ubuntu/app-backend
