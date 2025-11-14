#!/bin/bash
set -e  # fail script on any error

echo ">>> Fixing permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Ensuring correct permissions"
sudo chown -R ubuntu:ubuntu /home/ubuntu/app-backend

echo ">>> Installing production-only dependencies"
yarn --cwd /home/ubuntu/app-backend install --production --frozen-lockfile

echo ">>> Linking .env file"
ln -s /home/ubuntu/.env /home/ubuntu/app-backend/.env

echo ">>> Install step completed successfully"
