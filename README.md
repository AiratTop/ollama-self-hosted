# Ollama Self-Hosted with Docker

![ollama-self-hosted](https://repository-images.githubusercontent.com/1071074164/fcb6df2a-a8df-4630-8ff1-725ab7b92197)

This repository provides a `docker-compose` setup to run a self-hosted [Ollama](https://ollama.com/) instance with the [Open WebUI](https://github.com/open-webui/open-webui).

It is configured to connect to a shared Docker network, allowing easy integration with other services like [n8n](https://github.com/AiratTop/n8n-self-hosted).

## What’s included

-   ✅ **Complete Privacy**: Your data is processed locally and never leaves your machine.
-   ✅ **Offline Access**: Works without an internet connection after initial setup.
-   ✅ **No Rate Limits or Costs**: Use models as much as you want without API fees.
-   ✅ **Ollama**: Run and manage large language models locally.
-   ✅ **Open WebUI**: A user-friendly web interface for Ollama.
-   ✅ **Multiple Hardware Profiles**: Pre-configured for CPU, NVIDIA, and AMD GPUs.
-   ✅ **Helper Scripts**: Easy-to-use scripts for starting, restarting, and updating the services.

## Installation

### 1. Clone the Repository

```bash
git clone https://github.com/AiratTop/ollama-self-hosted.git
cd ollama-self-hosted
```

### 2. Create the Shared Network

If you haven't already, create the shared Docker network. This allows other containers (like [n8n](https://github.com/AiratTop/n8n-self-hosted)) to communicate with Ollama.

```bash
docker network create shared_network
```

### 3. Configure the Profile

Edit the `.env` file to select the hardware profile for Ollama.

```bash
# .env
# Choose one of the available profiles: cpu, gpu-nvidia, gpu-amd
COMPOSE_PROFILES=cpu
```

-   `cpu`: For CPU-only inference.
-   `gpu-nvidia`: For NVIDIA GPUs. Requires the [NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).
-   `gpu-amd`: For AMD GPUs on Linux.

## Running the Services

Once you have configured your profile in the `.env` file, you can use the helper scripts to manage the services.

-   **Start:**
    ```bash
    docker compose up -d
    ```
-   **Restart:**
    ```bash
    ./restart-docker.sh
    ```
-   **Update:**
    ```bash
    ./update-docker.sh
    ```

After starting the services, you can access the Open WebUI at [http://localhost:8080](http://localhost:8080).

![webui](https://github.com/open-webui/open-webui/blob/main/demo.gif)

## Connecting with n8n

This setup is part of a larger collection of self-hosted services designed to create a complete, private development stack. It is pre-configured to work seamlessly with projects like [n8n-self-hosted](https://github.com/AiratTop/n8n-self-hosted).

Since both services are on the `shared_network`, you can connect to Ollama from your n8n "Ollama" node using `http://ollama:11434` as the **Base URL**.

For other components like [Qdrant](https://github.com/AiratTop/qdrant-self-hosted), [Caddy](https://github.com/AiratTop/caddy-self-hosted), and [monitoring](https://github.com/AiratTop/monitoring-self-hosted), see the list in the **See Also** section below.

## Downloading Models

After starting the services, you can download models in two ways:

### 1. Using the Command Line

You can pull models directly from the command line using `docker exec`. Browse available models on the [Ollama Library](https://ollama.com/library).

For example, to download the `gemma3:1b` model, run:

```bash
docker exec -it ollama ollama pull gemma3:1b
```

### 2. Using the Open WebUI

You can also download models through the web interface.

1.  Open the Open WebUI at [http://localhost:8080](http://localhost:8080).
2.  Open the "Models" dropdown in the top menu.
3.  In the "Pull a model" field, enter the name of the model you want to download (e.g., `gemma3:1b`) and click the download button.

## See Also

Check out other self-hosted solutions:

-   [**postgresql-self-hosted**](https://github.com/AiratTop/postgresql-self-hosted): A simple and robust PostgreSQL setup.
-   [**mysql-self-hosted**](https://github.com/AiratTop/mysql-self-hosted): A self-hosted MySQL instance.
-   [**clickhouse-self-hosted**](https://github.com/AiratTop/clickhouse-self-hosted): High-performance columnar database for analytics.
-   [**metabase-self-hosted**](https://github.com/AiratTop/metabase-self-hosted): Self-hosted Metabase on Docker for business intelligence and analytics.
-   [**qdrant-self-hosted**](https://github.com/AiratTop/qdrant-self-hosted): A vector database for AI applications.
-   [**redis-self-hosted**](https://github.com/AiratTop/redis-self-hosted): A fast in-memory data store, often used as a cache or message broker.
-   [**caddy-self-hosted**](https://github.com/AiratTop/caddy-self-hosted): A modern, easy-to-use web server with automatic HTTPS.
-   [**wordpress-self-hosted**](https://github.com/AiratTop/wordpress-self-hosted): Production-ready WordPress stack with MySQL, phpMyAdmin, and WP-CLI.
-   [**n8n-self-hosted**](https://github.com/AiratTop/n8n-self-hosted): Scalable n8n with workers, Caddy for auto-HTTPS, and backup scripts.
-   [**monitoring-self-hosted**](https://github.com/AiratTop/monitoring-self-hosted): Self-hosted monitoring stack with Prometheus and Grafana.
-   [**ollama-self-hosted**](https://github.com/AiratTop/ollama-self-hosted): Ready-to-use solution for running Ollama with the Open WebUI on Docker.
-   [**authentik-self-hosted**](https://github.com/AiratTop/authentik-self-hosted): Authentik is a flexible, open-source Identity & Access Management (IAM) solution.
-   [**gatus-self-hosted**](https://github.com/AiratTop/gatus-self-hosted): Automated service health dashboard with a PostgreSQL backend and backup scripts.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## Author

**Airat Halitov**

- Website: [airat.top](https://airat.top)
- GitHub: [@AiratTop](https://github.com/AiratTop)
- Email: [mail@airat.top](mailto:mail@airat.top)
- Repository: [ollama-self-hosted](https://github.com/AiratTop/ollama-self-hosted)
