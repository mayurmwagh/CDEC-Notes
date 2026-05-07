# 📘 DevOps & Containerization Notes

---

## 🏗️ 1. Monolithic vs Microservices Architecture

### 🔹 Monolithic Architecture
- Entire application is built as a **single unit**
- All components (UI, Business Logic, Database) are tightly coupled

**Advantages:**
- Simple development and deployment
- Easier debugging (initial phase)

**Disadvantages:**
- Hard to scale specific components
- Full redeployment required for small changes
- Technology lock-in

---

### 🔹 Microservices Architecture
- Application divided into **small independent services**
- Each service handles a specific functionality

**Advantages:**
- Independent deployment
- High scalability
- Technology flexibility

**Disadvantages:**
- Complex system design
- Requires inter-service communication (API, messaging)
- Difficult monitoring and debugging

---

### 🔸 Key Differences

| Feature        | Monolithic              | Microservices              |
|----------------|------------------------|----------------------------|
| Structure      | Single unit            | Multiple services          |
| Deployment     | Full application       | Service-wise               |
| Scalability    | Difficult              | Easy                       |
| Flexibility    | Low                    | High                       |
| Maintenance    | Complex over time      | Easier                     |

---

## 💻 2. Deployment Models

---

### 🔹 Traditional Deployment
- Application runs directly on **Physical Server**
- OS installed on hardware

**Limitations:**
- Poor resource utilization
- Limited scalability
- Manual setup

---

### 🔹 Virtualization Deployment
- Uses **Hypervisor** to create **Virtual Machines (VMs)**

**Examples:** VMware, VirtualBox, KVM

**Advantages:**
- Better resource utilization
- Isolation between VMs

**Disadvantages:**
- Heavy (each VM has full OS)
- Slower startup

---

### 🔹 Containerization Deployment
- Uses **Containers** instead of VMs
- Shares host OS kernel

**Advantages:**
- Lightweight
- Fast startup
- Highly portable

---

### 🔸 Comparison Table

| Feature        | Traditional        | Virtualization        | Containerization     |
|---------------|------------------|----------------------|----------------------|
| Resource Use  | Low efficiency    | Medium               | High efficiency      |
| OS Required   | One per server    | One per VM           | Shared kernel        |
| Startup Time  | Slow              | Medium               | Fast                 |
| Performance   | High              | Medium               | High                 |

---

## 📦 3. Containerization Basics

---

### 🔹 What is Containerization?
- Technique to package application with dependencies
- Ensures consistency across environments

---

### 🔹 What is a Container?
- Lightweight executable package
- Includes:
  - Application code
  - Libraries
  - Dependencies

---

### 🔹 What is an Image?
- Read-only template used to create containers

---

### 🔸 Image vs Container

| Image                     | Container                  |
|--------------------------|----------------------------|
| Static                   | Running instance           |
| Read-only                | Read-write                 |
| Blueprint                | Execution                  |

---

## 🐳 4. Introduction to Docker

---

### 🔹 What is Docker?
- Open-source platform for containerization
- Used to build, ship, and run applications

---

### 🔹 Key Components
- Docker Engine
- Docker Image
- Docker Container
- Docker Hub

---

### 🔹 Benefits
- Environment consistency
- Fast deployment
- Lightweight

---

## ⚖️ 5. Docker CE vs Docker EE

---

### 🔹 Docker CE (Community Edition)
- Free and open-source
- Used for development/testing
- Community support

---

### 🔹 Docker EE (Enterprise Edition)
- Paid version
- Enterprise support
- Advanced security

---

### 🔸 Differences

| Feature     | Docker CE        | Docker EE        |
|-------------|-----------------|------------------|
| Cost        | Free            | Paid             |
| Support     | Community       | Enterprise       |
| Security    | Basic           | Advanced         |
| Usage       | Dev/Test        | Production       |

---

## ⚙️ 6. Install Docker Engine (Ubuntu)

```bash
# Update system
sudo apt update

# Install dependencies
sudo apt install -y ca-certificates curl gnupg lsb-release

# Add Docker GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo tee /etc/apt/keyrings/docker.gpg > /dev/null

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Verify installation
docker --version    