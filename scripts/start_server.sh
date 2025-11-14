#!/bin/bash
set -e

echo ">>> Fixing permissions before PM2 start"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Moving to app directory"
cd /home/ubuntu/app-backend

echo ">>> Checking if PM2 exists"
if ! command -v pm2 &> /dev/null
then
    echo "PM2 not found, installing..."
    sudo yarn global add pm2
fi

echo ">>> Restarting PM2 app"
pm2 restart app-backend || pm2 start dist/index.js --name app-backend

echo ">>> PM2 status"
pm2 status

echo ">>> Saving PM2 process"
pm2 save

echo ">>> PM2 start script complete"
