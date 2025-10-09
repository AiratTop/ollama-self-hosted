#!/bin/bash

source .env
echo "Selected ollama profile: ${COMPOSE_PROFILES}"

# Stop and remove older version
docker compose --profile "${COMPOSE_PROFILES:-cpu}" down