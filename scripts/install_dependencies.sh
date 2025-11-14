#!/bin/bash
set -e  # exit immediately if any command fails

cd /home/ubuntu/app-backend

# Install all dependencies including devDependencies
yarn install

# Build the app
yarn build

# yarn install --production --frozen-lockfile
