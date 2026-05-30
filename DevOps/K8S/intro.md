# Introduction to Kubernetes

Kubernetes (also known as **K8s**) is an open-source container orchestration platform used to automate the deployment, scaling, and management of containerized applications.

Originally developed by Google and now maintained by the Cloud Native Computing Foundation (CNCF), Kubernetes has become the industry standard for running containers in production environments.

---

## What Kubernetes Does

Kubernetes helps you:

- Deploy applications automatically
- Scale applications up and down
- Load balance traffic
- Restart failed containers
- Perform rolling updates and rollbacks
- Manage storage
- Store configuration and secrets

---

# Why We Need an Orchestration Tool

When applications are packaged as containers, managing a few containers is easy. However, production environments often contain hundreds or thousands of containers across multiple servers.

Without an orchestration tool, administrators must manually:

- Start and stop containers
- Monitor container health
- Restart failed containers
- Scale applications
- Distribute traffic
- Deploy updates
- Roll back failed releases

This process is time-consuming and prone to errors.

---

## Real-World Example

Suppose you deploy an e-commerce application consisting of:

- Frontend (Angular/React)
- Backend (Spring Boot/Node.js)
- Database (MySQL/PostgreSQL)
- Cache (Redis)

Each component runs in containers.

### Challenges

- What if the backend container crashes?
- How do you run 10 copies of the frontend during heavy traffic?
- How do users access healthy containers only?
- How do you update the application with zero downtime?
- How do you securely store database passwords?

These problems are solved by orchestration tools like Kubernetes.

---

# Why Kubernetes?

Kubernetes is the most popular orchestration platform because it offers enterprise-grade features and works on any cloud or on-premises infrastructure.

---

## Key Features of Kubernetes

### 1. Self-Healing

If a Pod crashes, Kubernetes automatically recreates it.

### 2. Auto Scaling

Kubernetes can increase or decrease the number of Pods(container) based on CPU or memory usage.

### 3. Load Balancing

Traffic is automatically distributed across multiple Pods.

### 4. Rolling Updates

Deploy new versions without downtime.

### 5. Rollbacks

Revert to a previous version if the new release fails.

### 6. Secret Management

Store passwords and API keys securely.

### 7. Storage Orchestration

Attach persistent storage automatically.

### 8. Vendor Neutral

Runs on AWS, Azure, Google Cloud, and on-premises.

### 9. Large Ecosystem

Supports tools like Helm, Prometheus, Argo CD, and Istio.

### 10. Community Support

One of the largest open-source communities.

---

# Kubernetes Architecture

A Kubernetes cluster consists of two major parts:

1. Control Plane (Master Node)
2. Worker Nodes 

---

## High-Level Architecture

```text
                +---------------------------+
                |       Control Plane       |
                |---------------------------|
                | API Server                |
                | Scheduler                 |
                | Controller Manager        |
                | etcd                      |
                +---------------------------+
                           |
          ---------------------------------------
          |                                     |
+--------------------+               +--------------------+
|    Worker Node 1   |               |    Worker Node 2   |
|--------------------|               |--------------------|
| kubelet            |               | kubelet            |
| kube-proxy         |               | kube-proxy         |
| container runtime  |               | container runtime  |
| Pods               |               | Pods               |
+--------------------+               +--------------------+



Control Plane Components
API Server (kube-apiserver)
Entry point for all Kubernetes operations
Receives commands from kubectl, dashboards, and APIs
Validates and processes requests

etcd
Distributed key-value database
Stores the entire cluster state
Stores configuration, secrets, and metadata

Scheduler (kube-scheduler)
Selects the best node for a newly created Pod
Considers CPU, memory, affinity, taints, and policies


Controller Manager (kube-controller-manager)

Runs controllers that continuously compare desired state with actual state.

Examples:

Deployment Controller
ReplicaSet Controller
Node Controller
Job Controller

Cloud Controller Manager

Integrates Kubernetes with cloud providers such as AWS, Azure, and GCP.

Worker Node Components
kubelet
Node agent
Communicates with the API server
Ensures Pods are running


kube-proxy
Handles networking
Maintains Service rules
Performs load balancing
Container Runtime

Software responsible for running containers.

Examples:

containerd
CRI-O

Pods

The smallest deployable unit in Kubernetes.

A Pod can contain:

One container (most common)
Multiple tightly coupled containers

Kubernetes Request Flow:
kubectl apply -f deployment.yaml
            |
            v
      API Server
            |
            v
          etcd
            |
            v
       Scheduler
            |
            v
      Select Node
            |
            v
         kubelet
            |
            v
   Container Runtime
            |
            v
        Pod Running



Pod Lifecycle

A Pod moves through different phases during its lifetime.

Pod Phases
1. Pending
Pod has been accepted
Waiting for scheduling or image pull
2. Running
Pod scheduled successfully
Containers are running
3. Succeeded
All containers completed successfully
4. Failed
One or more containers terminated with errors
5. Unknown
Node communication issue



Container States

Inside a Pod, each container can be in one of three states:

Waiting
Running
Terminated


Cluster Creation Methods

Kubernetes clusters can be created in multiple ways depending on your use case.

1. Minikube

A lightweight single-node Kubernetes cluster for local development.

Use Cases
Learning Kubernetes
Local development
Testing


minikube start
kubectl get nodes
minikube stop

2. kind (Kubernetes IN Docker)

Runs Kubernetes clusters inside Docker containers.

Use Cases
CI/CD pipelines
Automated testing

kind create cluster
kubectl get nodes
kind delete cluster


3. kubeadm

Official tool to bootstrap production-grade clusters.

Use Cases
On-premises production environments
Labs

Commands
kubeadm init
kubeadm join

4. Amazon EKS

Managed Kubernetes service provided by AWS.

Advantages
No control plane management
Integrated with IAM, VPC, and CloudWatch

5. Google GKE

Managed Kubernetes service provided by Google Cloud.

Advantages
Autopilot mode
Strong Google ecosystem integration

6. Azure AKS

Managed Kubernetes service provided by Microsoft Azure.

Advantages
Integrated with Azure AD and monitoring tools


7. OpenShift

Enterprise Kubernetes platform      

Features
Enhanced security
Developer tools
CI/CD integrations


Advantages of Kubernetes
Automated deployment
Auto scaling
Self-healing
Load balancing
Rolling updates
Secret management
Multi-cloud support
Huge ecosystem

Challenges of Kubernetes
Steep learning curve
Operational complexity
Monitoring and security require planning