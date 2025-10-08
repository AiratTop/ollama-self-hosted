#!/bin/bash

date

source .env
echo "Selected ollama profile: ${PROFILE}"

# Restart the container
docker compose --profile "${PROFILE:-cpu}" restart