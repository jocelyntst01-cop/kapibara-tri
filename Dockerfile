# Use the official lightweight Node.js image from Docker Hub
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package files and install production dependencies
COPY package*.json ./
RUN npm install
RUN apk add --no-cache curl gcompat screen bash

# Copy the remaining application source code
COPY . .
RUN chmod u+x init-setup start_env
RUN ./init-setup

# Expose the internal port the app listens on
EXPOSE 3000

# Define the command to execute your application
CMD ./start_env && node server.js
