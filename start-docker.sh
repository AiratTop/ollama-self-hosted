#!/bin/bash

source .env
echo "Selected ollama profile: ${PROFILE}"

# Start the container
docker compose --profile "${PROFILE:-cpu}" up -d