#!/bin/bash
set -e

echo ">>> Fixing permissions before PM2 start"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Moving to app directory"
cd /home/ubuntu/app-backend

# Define the full path to the pm2 executable
PM2_PATH=/home/ubuntu/.nvm/versions/node/v18.17.1/bin/pm2

# Install PM2 if it's not already there
if ! command -v $PM2_PATH &> /dev/null
then
    echo "PM2 not found, installing..."
    yarn global add pm2
fi

echo ">>> Starting application with PM2"
# Stop and delete the old process to ensure a clean start
$PM2_PATH delete app-backend || echo "app-backend not found, continuing..."

# Start the application
$PM2_PATH start dist/index.js --name app-backend

echo ">>> PM2 status"
$PM2_PATH status

echo ">>> Saving PM2 process list for system reboot"
sudo env PATH=$PATH:/home/ubuntu/.nvm/versions/node/v18.17.1/bin $PM2_PATH save

echo ">>> PM2 start script complete"
