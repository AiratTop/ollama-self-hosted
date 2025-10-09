#!/bin/bash

source .env
echo "Selected ollama profile: ${COMPOSE_PROFILES}"

# Start the container
docker compose --profile "${COMPOSE_PROFILES:-cpu}" up -d