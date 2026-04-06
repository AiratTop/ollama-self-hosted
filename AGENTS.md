# AGENTS.md

## Purpose
Public self-hosted deployment template for local LLM inference with Ollama + Open WebUI.

## Repository Role
- Category: `*-self-hosted` (public GitHub repository).
- Related local stack: `../ollama-docker`.
- Main entrypoint: `docker-compose.yml`.

## Stack Summary
- Services: `webui`, `ollama-cpu`, `ollama-gpu`, `ollama-gpu-amd`.
- Exposed ports: `8080` (WebUI), `11434` (Ollama API).
- External network: `shared_network`.
- Hardware profiles: `cpu`, `gpu-nvidia`, `gpu-amd`.

## Data and Config
- Ollama models/data: `./data/ollama`.
- Open WebUI data: `./data/webui`.
- Shared service anchor: `x-ollama`.

## Operations
- Restart stack: `./restart-docker.sh`.
- Update images and restart: `./update-docker.sh`.

## AI Working Notes
- Start only one Ollama profile at a time unless explicitly planning multi-profile behavior.
- Keep WebUI secrets/API keys in `.env` (`WEBUI_SECRET_KEY`, `OPENAI_API_KEY`).
- Preserve `OLLAMA_BASE_URL=http://ollama:11434` compatibility for WebUI.
