#!/bin/bash

cd /opt/github-runner

# Configure (paste your token when prompted)
./config.sh --url https://github.com/YOUR_USERNAME/CommandCenter --token YOUR_TOKEN --labels cc-infra --name cc-infra-runner --unattended

# Install as a system service (runs on boot)
sudo ./svc.sh install tomas

# Start it
sudo ./svc.sh start

# Check status
sudo ./svc.sh status