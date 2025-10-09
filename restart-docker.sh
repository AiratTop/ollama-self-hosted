#!/bin/bash

date

source .env
echo "Selected ollama profile: ${COMPOSE_PROFILES}"

# Restart the container
docker compose --profile "${COMPOSE_PROFILES:-cpu}" restart