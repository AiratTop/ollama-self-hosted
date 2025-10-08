#!/bin/bash

date

source .env
echo "Selected ollama profile: ${PROFILE}"

# backup container version
date >> docker-image-versions.txt
docker images >> docker-image-versions.txt

# Pull latest version
docker compose --profile "${PROFILE:-cpu}" pull

# Stop and remove older version
./stop-docker.sh

# Start the container
./start-docker.sh