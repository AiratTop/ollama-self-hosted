#!/bin/bash

source .env
echo "Selected ollama profile: ${PROFILE}"

# Stop and remove older version
docker compose --profile "${PROFILE:-cpu}" down