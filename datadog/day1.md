# Datadog - Complete Detailed Notes

# Module 1: Introduction to Datadog

## What is Datadog?

Datadog is a cloud-native observability and monitoring platform that provides real-time visibility into infrastructure, applications, logs, containers, cloud services, networks, and security events.

It helps DevOps Engineers, Cloud Engineers, Site Reliability Engineers (SREs), System Administrators, and Developers monitor the health and performance of their IT infrastructure from a centralized dashboard.

Datadog follows a Software-as-a-Service (SaaS) model, meaning users do not need to maintain monitoring servers. All collected data is securely sent to Datadog's cloud platform for analysis and visualization.

---

## Why Do We Need Datadog?

Modern IT environments contain:

* Linux Servers
* Windows Servers
* AWS Cloud Resources
* Azure Resources
* Google Cloud Resources
* Docker Containers
* Kubernetes Clusters
* Microservices
* Databases
* Load Balancers

Without monitoring:

* Server failures may go unnoticed.
* Applications may become slow.
* Containers may crash unexpectedly.
* Disk space may become full.
* Root cause analysis becomes difficult.

Datadog provides:

* Centralized Monitoring
* Real-Time Alerting
* Performance Analytics
* Log Management
* Infrastructure Visibility

---

## Core Components of Datadog

### Infrastructure Monitoring

Monitors:

* Physical Servers
* Virtual Machines
* Cloud Instances
* Containers
* Kubernetes Nodes

Metrics Collected:

* CPU Utilization
* Memory Usage
* Disk Usage
* Network Traffic
* Process Information

### Application Performance Monitoring (APM)

Tracks:

* Request Response Time
* Service Latency
* Error Rates
* Throughput
* Database Query Performance

Example:

```text
User → Web Server → API → Database
```

### Log Management

Collects logs from:

* Linux Systems
* Applications
* Containers
* Kubernetes Pods

Example:

```bash
ERROR: Database Connection Failed
```

```bash
User Login Successful
```

### Container Monitoring

Supports:

* Docker
* Kubernetes
* ECS
* OpenShift

Tracks:

* Running Containers
* CPU Usage
* Memory Usage
* Restart Count

### Network Monitoring

Provides visibility into:

* Network Traffic
* DNS Queries
* Service Communication

### Security Monitoring

Helps detect:

* Unauthorized Access
* Security Threats
* Compliance Violations

---

## Datadog Architecture

```text
+----------------------+
| Linux Server         |
| Docker Container     |
| Kubernetes Cluster   |
+----------+-----------+
           |
           v
+----------------------+
| Datadog Agent        |
+----------+-----------+
           |
           v
+----------------------+
| Datadog Cloud        |
+----------+-----------+
           |
           v
+----------------------+
| Dashboards           |
| Alerts               |
| Logs                 |
| Metrics              |
| Traces               |
+----------------------+
```

---

# Module 2: Installing Datadog Agent on Linux

## What is Datadog Agent?

Datadog Agent is a lightweight software installed on monitored systems.

Responsibilities:

* Collect Metrics
* Collect Logs
* Collect Events
* Collect Traces
* Send Data to Datadog

### Agent Components

#### Core Agent

Collects:

* CPU Metrics
* Memory Metrics
* Disk Metrics
* Network Metrics

#### Trace Agent

Collects:

* Application Traces

#### Process Agent

Collects:

* Running Processes
* Process Resource Usage

---

## Prerequisites

Before installation:

* Datadog Account
* Datadog API Key
* Linux Server
* Internet Connectivity

### Generate API Key

Navigate to:

```text
Organization Settings
→ API Keys
```

Generate and copy the API key.

---

## Installing Datadog Agent on Ubuntu

### Update Packages

```bash
sudo apt update
```

### Install Datadog Agent

```bash
DD_API_KEY=<YOUR_API_KEY> \
DD_SITE="datadoghq.com" \
bash -c "$(curl -L https://install.datadoghq.com/scripts/install_script_agent7.sh)"
```

### Verify Agent Service

```bash
sudo systemctl status datadog-agent
```

Expected Output:

```text
active (running)
```

### Check Agent Status

```bash
sudo datadog-agent status
```

### Verify Hostname

```bash
sudo datadog-agent hostname
```

Example Output:

```text
ip-172-31-24-3
```

---

## Datadog Configuration File

Location:

```bash
/etc/datadog-agent/datadog.yaml
```

Important Settings:

```yaml
api_key: YOUR_API_KEY

site: datadoghq.com

logs_enabled: true
```

---

## Agent Management Commands

### Start Agent

```bash
sudo systemctl start datadog-agent
```

### Stop Agent

```bash
sudo systemctl stop datadog-agent
```

### Restart Agent

```bash
sudo systemctl restart datadog-agent
```

### Agent Logs

```bash
sudo journalctl -u datadog-agent
```

---

# Module 3: Installing Datadog Agent on Docker

## Why Docker Monitoring?

Containers are dynamic and short-lived.

Example:

```bash
docker run nginx
```

A container may start and stop frequently, making traditional monitoring difficult.

Datadog continuously monitors container performance.

---

## Docker Metrics Collected

### CPU Usage

```text
docker.cpu.usage
```

### Memory Usage

```text
docker.mem.usage
```

### Network Traffic

```text
docker.net.bytes_rcvd
docker.net.bytes_sent
```

### Container Count

```text
docker.containers.running
docker.containers.stopped
```

---

## Docker Monitoring Architecture

```text
+---------------------+
| Docker Host         |
+----------+----------+
           |
+----------v----------+
| Datadog Agent       |
+----------+----------+
           |
+----------v----------+
| Datadog Cloud       |
+---------------------+
```

---

## Run Datadog Agent Container

```bash
docker run -d \
--name datadog-agent \
--cgroupns host \
-e DD_API_KEY=<API_KEY> \
-e DD_SITE="datadoghq.com" \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
-v /proc/:/host/proc/:ro \
-v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
gcr.io/datadoghq/agent:latest
```

### Verify Container

```bash
docker ps
```

### View Logs

```bash
docker logs datadog-agent
```

---

# Module 4: Introduction to Datadog UI

## Main Navigation Menu

The Datadog dashboard contains:

* Infrastructure
* Dashboards
* Monitors
* Logs
* APM
* Security
* Integrations

---

## Infrastructure Section

Displays:

* Hosts
* Containers
* Processes
* Kubernetes Clusters

---

## Dashboards

Dashboards provide graphical visualization of metrics.

Examples:

* CPU Usage
* Memory Usage
* Network Traffic
* Container Status

---

## Monitors

Used to create alerts.

Examples:

```text
CPU > 80%
Memory > 90%
Disk > 85%
```

---

## Log Explorer

Used for searching logs.

Examples:

```text
service:nginx
```

```text
status:error
```

---

# Module 5: Infrastructure Monitoring

## What is Infrastructure Monitoring?

Infrastructure Monitoring provides visibility into:

* Servers
* Containers
* Databases
* Cloud Resources
* Kubernetes Clusters

---

## Important Metrics

### CPU Metrics

```text
system.cpu.user
system.cpu.system
system.cpu.idle
```

### Memory Metrics

```text
system.mem.used
system.mem.free
system.mem.pct_usable
```

### Disk Metrics

```text
system.disk.used
system.disk.free
```

### Network Metrics

```text
system.net.bytes_rcvd
system.net.bytes_sent
```

---

# Module 6: Monitoring Hosts

## What is a Host?

Any machine running Datadog Agent.

Examples:

* EC2 Instance
* Ubuntu Server
* RHEL Server
* Windows Server

---

## Host Monitoring

Navigate:

```text
Infrastructure
→ Hosts
```

Information Available:

* Hostname
* CPU Usage
* Memory Usage
* Disk Usage
* Network Activity

---

## Host Map

Provides visual representation of infrastructure.

Color Indicators:

| Color  | Status   |
| ------ | -------- |
| Green  | Healthy  |
| Yellow | Warning  |
| Red    | Critical |

---

## Host Tags

Examples:

```text
env:production
team:devops
application:jenkins
```

Benefits:

* Resource Grouping
* Easy Filtering
* Better Organization

---

# Module 7: Monitoring Docker

## Docker Monitoring Dashboard

Navigate:

```text
Infrastructure
→ Containers
```

---

## Container Information

Datadog displays:

* Container Name
* Image Name
* CPU Usage
* Memory Usage
* Restart Count
* Container State

---

## Common Docker Alerts

### High CPU Usage

```text
docker.cpu.usage > 80%
```

### High Memory Usage

```text
docker.mem.usage > 90%
```

### Excessive Restarts

```text
restart_count > 5
```

---

# Module 8: Monitoring Kubernetes

## Why Kubernetes Monitoring?

Kubernetes environments contain multiple:

* Nodes
* Pods
* Deployments
* Services
* Namespaces

Monitoring these resources manually is difficult.

Datadog automatically collects and visualizes cluster-wide metrics.

---

## Kubernetes Architecture

```text
Cluster
│
├── Nodes
├── Namespaces
├── Deployments
├── Services
└── Pods
```

---

## Install Datadog on Kubernetes

### Add Helm Repository

```bash
helm repo add datadog https://helm.datadoghq.com
helm repo update
```

### Install Datadog Agent

```bash
helm install datadog-agent datadog/datadog \
--set datadog.apiKey=<API_KEY>
```

---

## Kubernetes Metrics

### Cluster Metrics

```text
kubernetes.nodes.count
kubernetes.pods.running
```

### Node Metrics

* CPU Usage
* Memory Usage
* Disk Usage

### Pod Metrics

* Pod Status
* Pod Restarts
* CPU Usage
* Memory Usage

### Deployment Metrics

```text
Desired Replicas
Available Replicas
Unavailable Replicas
```

---

## Kubernetes Dashboard

Navigate:

```text
Infrastructure
→ Kubernetes
```

Available Views:

* Clusters
* Nodes
* Pods
* Deployments
* Services
* Namespaces

---

# Datadog Interview Questions

## What is Datadog?

Datadog is a SaaS-based monitoring and observability platform used to monitor infrastructure, applications, logs, containers, and cloud services.

## What is Datadog Agent?

A lightweight software that collects metrics, logs, traces, and events and sends them to Datadog.

## What are the main components of Datadog?

* Infrastructure Monitoring
* APM
* Log Management
* Container Monitoring
* Security Monitoring
* Dashboards
* Monitors

## What is the difference between Dashboard and Monitor?

| Dashboard          | Monitor                     |
| ------------------ | --------------------------- |
| Visualization Tool | Alerting Tool               |
| Displays Metrics   | Generates Notifications     |
| Used for Analysis  | Used for Incident Detection |

## How do you monitor Docker in Datadog?

By installing the Datadog Agent with Docker integration and mounting the Docker socket.

## How do you monitor Kubernetes in Datadog?

By deploying the Datadog Agent using Helm charts or the Datadog Operator.
