# Use Node 20
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if exists)
COPY package*.json ./

# Install dependencies
RUN yarn install

# Copy all backend source code
COPY . .

# Expose backend port
EXPOSE 4000

# Run the app in development mode using ts-node-dev
CMD ["yarn", "run", "dev"]
