#!/bin/sh

# Update the package list
apt-get update

# Install required packages for adding the Docker repository
apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/$(lsb_release -si | tr '[:upper:]' '[:lower:]')/gpg | apt-key add -

# Set up the Docker stable repository
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/$(lsb_release -si | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the package list again
apt-get update

# Install Docker CE, CLI, and other required components
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

