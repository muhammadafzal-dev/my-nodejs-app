#!/bin/bash
set -e  # fail script on any error

echo ">>> Fixing permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Moving to app directory"
cd /home/ubuntu/app-backend

echo ">>> Ensuring correct permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Installing full dependencies (including dev)"
yarn install --frozen-lockfile

echo ">>> Copying .env file from backup"
cp /home/ubuntu/app-backend-backup/.env /home/ubuntu/app-backend/ 2>/dev/null || true

echo ">>> Building project"
yarn build

echo ">>> Installing production-only dependencies"
yarn install --production --frozen-lockfile

echo ">>> Install step completed successfully"
