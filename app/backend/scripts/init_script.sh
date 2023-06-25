#!/bin/bash
set -e

# Update package lists and install necessary dependencies
sudo apt update
sudo apt install -y git ca-certificates curl gnupg2

# Install Docker and Docker Compose
curl -fsSL https://get.docker.com -o get-docker.sh
chmod +x get-docker.sh && ./get-docker.sh

# Clone the repository
git clone https://github.com/tomiabr/devops-challenge.git
cd devops-challenge/app

# Build and run the containers using Docker Compose
sudo docker compose up -d

echo "Setup completed successfully."