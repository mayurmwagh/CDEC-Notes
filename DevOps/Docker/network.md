# Docker Networking Notes

# Introduction to Docker Networking

Docker networking allows containers to communicate with:
- Other containers
- Docker host machine
- External networks (Internet)

Each container gets connected to a network. Docker provides different network drivers for different use cases.

---

# Why Docker Networking is Important

- Enables communication between containers
- Provides isolation and security
- Allows access to external applications
- Supports multi-container applications
- Provides automatic DNS resolution

---

# Docker Network Drivers

Docker provides several built-in network drivers.

---

# 1. Bridge Network

Bridge is the default network driver in Docker.

## Features
- Used for standalone containers
- Containers communicate using IP address or container name
- Works on the same Docker host

## Example

```bash
docker run -d --name web nginx
```

Check network:

```bash
docker inspect web
```

---

# 2. Host Network

The container shares the host machine's network stack.

## Features
- No network isolation
- Faster performance
- No port mapping required

## Example

```bash
docker run --network host nginx
```

---

# 3. None Network

Disables networking completely.

## Features
- No external communication
- Fully isolated container

## Example

```bash
docker run --network none alpine
```

---

# 4. Overlay Network

Used for communication between containers running on different Docker hosts.

## Features
- Used in Docker Swarm
- Multi-host communication

---

# 5. Macvlan Network

Assigns a MAC address to containers.

## Features
- Containers behave like physical devices
- Directly connected to physical network

---

# Docker Network Commands

# List All Networks

```bash
docker network ls
```

Example Output:

```bash
NETWORK ID     NAME      DRIVER    SCOPE
12ab34cd56ef   bridge    bridge    local
78gh90ij12kl   host      host      local
34mn56op78qr   none      null      local
```

---

# Inspect Network Details

```bash
docker network inspect bridge
```

This command shows:
- Connected containers
- IP ranges
- Gateway information
- Driver details

---

# Create a New Network

```bash
docker network create mynet
```

Using a specific driver:

```bash
docker network create --driver bridge mynet
```

---

# Delete a Network

```bash
docker network rm mynet
```

---

# Remove Unused Networks

```bash
docker network prune
```

---

# Connect Container to Network

```bash
docker network connect mynet container1
```

---

# Disconnect Container from Network

```bash
docker network disconnect mynet container1
```

---

# Run Container Using Specific Network

Syntax:

```bash
docker run --network <network-name> image-name
```

Example:

```bash
docker run -d --name web --network mynet nginx
```

---

# Practical Example: Communication Between Two Containers

# Step 1: Create Custom Network

```bash
docker network create demo-net
```

Verify:

```bash
docker network ls
```

---

# Step 2: Run Nginx Container

```bash
docker run -d --name nginx-server --network demo-net nginx
```

Check running containers:

```bash
docker ps
```

---

# Step 3: Run Alpine Client Container

```bash
docker run -it --name alpine-client --network demo-net alpine sh
```

---

# Step 4: Install Curl Inside Alpine

```sh
apk add --no-cache curl
```

---

# Step 5: Access Nginx Server

```sh
curl http://nginx-server
```

Expected Output:

```html
Welcome to nginx!
```

This proves both containers are communicating successfully.

---

# Another Example Using Ubuntu Container

## Run Apache Container

```bash
docker run -d --name apache-server --network demo-net httpd
```

## Run Ubuntu Client

```bash
docker run -it --name ubuntu-client --network demo-net ubuntu bash
```

Update packages:

```bash
apt update
apt install curl -y
```

Access Apache container:

```bash
curl http://apache-server
```

---

# Common docker run --network Examples

## Using Bridge Network

```bash
docker run --network bridge nginx
```

## Using Host Network

```bash
docker run --network host nginx
```

## Using None Network

```bash
docker run --network none alpine
```

## Using Custom Network

```bash
docker run --network app-net nginx
```

---


# Best Practices

- Use custom bridge networks
- Use meaningful container names
- Avoid using default bridge network
- Remove unused networks regularly
- Use host networking only when necessary
- Use overlay network for multi-host communication

---

# Troubleshooting Commands

## Check Running Containers

```bash
docker ps
```

## Check Network Details

```bash
docker network inspect demo-net
```

## Test Connectivity

```bash
ping nginx-server
```

## Check Container Logs

```bash
docker logs nginx-server
```

---

# Important Commands Summary

| Command                        | Description |
|----------                      |-------------|
| docker network ls              | List networks |
| docker network inspect bridge  | Inspect network |
| docker network create mynet    | Create network |
| docker network rm mynet.       | Delete network |
| docker network prune           | Remove unused networks |
| docker network connect         | Connect container |
| docker network disconnect      | Disconnect container |
| docker run --network           | Run container on network |

---

# Summary

Docker networking helps containers communicate securely and efficiently.

Main network drivers:
- bridge
- host
- none
- overlay
- macvlan

Important concepts:
- Custom bridge networks
- Container DNS resolution
- Multi-container communication
- Network isolation

Docker networking is an essential concept for:
- Microservices
- DevOps
- Kubernetes
- Containerized applications




Example

# Practical Example: Two Docker Containers Communicating with Each Other

In this example, we will create:

- A custom Docker network
- Two containers:
  - `web` (running Nginx)
  - `client` (running Ubuntu)
- Test communication between them using the container name

---

## Step 1: Create a Custom Network

```bash
docker network create app-network
```

This creates a custom bridge network named `app-network`.

---

## Step 2: Run the First Container (Nginx Web Server)

```bash
docker run -d --name web --network app-network nginx
```

This starts an Nginx container named `web`.

---

## Step 3: Run the Second Container (Ubuntu Client)

```bash
docker run -it --rm --name client --network app-network ubuntu bash
```

This starts an Ubuntu container and opens a Bash shell.

---

## Step 4: Install Required Tools

The base Ubuntu image does not include tools like `ping` and `curl` by default, so install them first.

```bash
apt update
apt install -y iputils-ping curl
```

---

## Step 5: Test Connectivity

### Ping the `web` Container

```bash
ping web
```

### Expected Output

```text
PING web (172.18.0.2): 56 data bytes
64 bytes from 172.18.0.2: seq=0 ttl=64 time=0.10 ms
64 bytes from 172.18.0.2: seq=1 ttl=64 time=0.08 ms
```

This confirms that the `client` container can resolve and reach the `web` container using Docker DNS.

---

## Step 6: Access the Nginx Web Page

```bash
curl http://web
```

### Expected Output

```html
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
...
```

This confirms application-level communication between the two containers.

---

# Network Architecture

```text
+----------------------- Docker Network: app-network -----------------------+
|                                                                          |
|   +-------------------+                     +--------------------------+   |
|   | Container: web    |                     | Container: client       |   |
|   | Image: nginx      | <---- DNS + TCP --->| Image: ubuntu          |   |
|   | Hostname: web     |                     | Hostname: client       |   |
|   +-------------------+                     +--------------------------+   |
|                                                                          |
+--------------------------------------------------------------------------+
```

---

## Verify Connected Containers

From the host machine:

```bash
docker network inspect app-network
```

This command shows both `web` and `client` under the `Containers` section.

---

## Complete Practical Example

```bash
# Create a custom network
docker network create app-network

# Run the first container (Nginx)
docker run -d --name web --network app-network nginx

# Run the second container (Ubuntu)
docker run -it --rm --name client --network app-network ubuntu bash

# Inside the Ubuntu container
apt update
apt install -y iputils-ping curl

# Test connectivity
ping web

# Access the Nginx web page
curl http://web
```

---

## Cleanup

Exit from the Ubuntu container:

```bash
exit
```

Remove the container and network:

```bash
docker rm -f web
docker network rm app-network
```

---

## Key Learning Points

- Containers on the same Docker network can communicate using container names.
- Docker provides built-in DNS resolution.
- No need to know container IP addresses manually.
- This approach is commonly used to connect:
  - Frontend and backend applications
  - Application and database containers
  - Microservices

---

```