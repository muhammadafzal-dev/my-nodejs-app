#!/bin/bash
pm2 restart all || pm2 start dist/index.js --name app-backend
