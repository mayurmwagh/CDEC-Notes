# Infrastructure as Code (IaC)

## Introduction to Infrastructure as Code (IaC)

Infrastructure as Code (IaC) is the practice of managing and provisioning infrastructure through code rather than manual processes.

Using IaC, infrastructure such as servers, networks, databases, storage, and security configurations can be defined in configuration files and automatically provisioned.

### Traditional Infrastructure Management

Traditionally, infrastructure is managed manually:

- Create servers manually
- Configure networking manually
- Install software manually
- Apply security settings manually

#### Challenges

- Human errors
- Inconsistent environments
- Slow deployments
- Difficult scalability
- Poor disaster recovery

---

## Infrastructure as Code Approach

```text
Code → Execute → Infrastructure Created
```

Example:

```hcl
resource "aws_instance" "webserver" {
  ami           = "ami-123456"
  instance_type = "t2.micro"
}
```

Terraform reads this configuration and creates the infrastructure automatically.

---

## Benefits of IaC

### 1. Automation

Infrastructure provisioning becomes automated.

### 2. Consistency

Same configuration across Development, Testing, and Production environments.

### 3. Version Control

Infrastructure code can be stored in Git repositories.

```bash
git add .
git commit -m "Added EC2 Instance"
```

### 4. Faster Deployment

Resources can be provisioned in minutes.

### 5. Scalability

Infrastructure can be scaled easily.

### 6. Disaster Recovery

Infrastructure can be recreated from code anytime.

---

# Why We Need IaC

Without IaC:

```text
Create Server
     ↓
Configure Network
     ↓
Install Software
     ↓
Configure Security
     ↓
Deploy Application
```

Problems:

- Time-consuming
- Manual effort
- Human errors
- Difficult to reproduce environments

With IaC:

```text
Write Code
     ↓
Execute
     ↓
Infrastructure Created Automatically
```

Advantages:

- Repeatable
- Reliable
- Automated
- Faster deployments

---

# Difference Between Shell Script, Ansible, and IaC Tools

| Feature | Shell Script | Ansible | Terraform |
|----------|-------------|----------|------------|
| Purpose | Task Automation | Configuration Management | Infrastructure Provisioning |
| Language | Bash/Shell | YAML | HCL |
| State Management | No | No | Yes |
| Agent Required | No | No | No |
| Infrastructure Creation | Limited | Moderate | Excellent |
| Configuration Management | Basic | Excellent | Limited |
| Idempotent | No | Yes | Yes |
| Cloud Support | Manual | Good | Excellent |

---

## Shell Script

Shell scripting is used to automate operating system tasks.

Example:

```bash
#!/bin/bash

yum install nginx -y
systemctl start nginx
systemctl enable nginx
```

### Advantages

- Easy to write
- Useful for Linux administration
- Lightweight

### Limitations

- Not idempotent
- Difficult to manage large infrastructure

---

## Ansible

Ansible is a Configuration Management and Automation Tool.

Example:

```yaml
---
- hosts: webservers
  become: true

  tasks:
    - name: Install Nginx
      yum:
        name: nginx
        state: present
```

### Use Cases

- Software installation
- Server configuration
- Patch management
- Application deployment

### Advantages

- Agentless
- Idempotent
- Easy YAML syntax

---

## Terraform

Terraform is an Infrastructure as Code (IaC) tool used to provision infrastructure.

Example:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-12345"
  instance_type = "t2.micro"
}
```

### Use Cases

- EC2 creation
- VPC creation
- Load Balancer creation
- Kubernetes Cluster provisioning

### Advantages

- Multi-cloud support
- State management
- Infrastructure automation
- Reusable modules

---

## Real-World Comparison

### Shell Script

```text
Install Nginx on Existing Server
```

### Ansible

```text
Install and Configure Nginx on 100 Servers
```

### Terraform

```text
Create 100 Servers + Network + Load Balancer
```

---

# Introduction to Terraform

## What is Terraform?

Terraform is an open-source Infrastructure as Code (IaC) tool developed by HashiCorp.

It allows users to define infrastructure using code and automatically provision resources across multiple cloud providers.

Supported Platforms:

- AWS
- Azure
- Google Cloud Platform (GCP)
- Kubernetes
- VMware
- Oracle Cloud
- DigitalOcean

---

## Terraform Workflow

```text
Write Configuration
        ↓
terraform init
        ↓
terraform plan
        ↓
terraform apply
        ↓
Infrastructure Created
```

---

## Key Features of Terraform

### Declarative Language

You define what you want, Terraform decides how to create it.

Example:

```hcl
resource "aws_instance" "web" {
  instance_type = "t2.micro"
}
```

### State Management

Terraform maintains a state file:

```text
terraform.tfstate
```

This file tracks all infrastructure resources.

### Execution Plan

Before making changes:

```bash
terraform plan
```

Terraform shows:

```text
+ Create
~ Modify
- Destroy
```

### Multi-Cloud Support

Terraform can manage resources across:

- AWS
- Azure
- GCP
- Kubernetes

using the same language.

---

# Terraform Language (Basic Syntax)

Terraform uses **HashiCorp Configuration Language (HCL)**.

Basic Syntax:

```hcl
block_type "label1" "label2" {

  argument = value

}
```

Example:

```hcl
resource "aws_instance" "web" {

  ami           = "ami-12345"
  instance_type = "t2.micro"

}
```

---

## Comments in Terraform

### Single-Line Comment

```hcl
# Comment

// Comment
```

### Multi-Line Comment

```hcl
/*
This is a
multi-line comment
*/
```

---

## Variables

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

Usage:

```hcl
instance_type = var.instance_type
```

---

## Output Values

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

---

## Local Values

```hcl
locals {
  environment = "dev"
}
```

Usage:

```hcl
tags = {
  Environment = local.environment
}
```

---

## Data Sources

Used to fetch information about existing resources.

```hcl
data "aws_ami" "amazon_linux" {

  most_recent = true

  owners = ["amazon"]
}
```

---

# Blocks Used in Terraform Language

Terraform configuration is built using blocks.

---

## 1. Terraform Block

Used to configure Terraform settings.

```hcl
terraform {

  required_version = ">= 1.0"

}
```

Example:

```hcl
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}
```

---

## 2. Provider Block

Defines the cloud provider.

```hcl
provider "aws" {

  region = "ap-south-1"

}
```

---

## 3. Resource Block

Creates infrastructure resources.

```hcl
resource "aws_instance" "web" {

  ami           = "ami-12345"
  instance_type = "t2.micro"

}
```

---

## 4. Variable Block

Defines input variables.

```hcl
variable "instance_type" {

  default = "t2.micro"

}
```

---

## 5. Output Block

Displays values after deployment.

```hcl
output "instance_ip" {

  value = aws_instance.web.public_ip

}
```

---

## 6. Local Block

Defines reusable values.

```hcl
locals {

  environment = "production"

}
```

---

## 7. Data Block

Reads information from existing resources.

```hcl
data "aws_ami" "latest" {

  most_recent = true

}
```

---

## 8. Module Block

Used to reuse Terraform configurations.

```hcl
module "vpc" {

  source = "./modules/vpc"

}
```

---

## 9. Provisioner Block

Executes commands during resource creation.

```hcl
resource "aws_instance" "web" {

  provisioner "local-exec" {
    command = "echo Instance Created"
  }

}
```

---

# Summary

- IaC automates infrastructure provisioning through code.
- Shell Script is used for OS-level task automation.
- Ansible is used for configuration management and application deployment.
- Terraform is used for infrastructure provisioning.
- Terraform uses HCL (HashiCorp Configuration Language).
- Major Terraform blocks include:
  - terraform
  - provider
  - resource
  - variable
  - output
  - locals
  - data
  - module
  - provisioner
- Terraform workflow:
  - terraform init
  - terraform plan
  - terraform apply