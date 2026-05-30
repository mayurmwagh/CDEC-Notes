Terraform required_providers Block

The required_providers block is used to tell Terraform which providers your configuration depends on and which versions are allowed.

Providers are plugins that Terraform uses to interact with cloud platforms and services such as:

Amazon Web Services (aws)
Microsoft Azure (azurerm)
Google Google Cloud (google)
VMware (vsphere)
HashiCorp Vault (vault)


terraform {
  required_providers {
    provider_name = {
      source  = "namespace/provider"
      version = "version_constraint"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


Explanation
aws → local name used in Terraform code.
source = "hashicorp/aws" → provider registry address.
version = "~> 5.0" → use version 5.x, but not 6.0.


Version Constraint Operators
Exact Version
version = "5.34.0"

Uses only version 5.34.0.

Greater Than or Equal To
version = ">= 5.0"

Uses any version 5.0 or higher.

Range
version = ">= 5.0, < 6.0"

Uses any version from 5.0 up to, but not including, 6.0.

Pessimistic Constraint (~>)
version = "~> 5.0"

Allows versions:

5.0
5.1
5.99

Not allowed:

6.0
version = "~> 5.34"

Allows:

5.34.x

Not:

5.35.0
Multiple Providers Example
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}



What If You Do Not Use It?

Terraform may:

Select a provider version automatically
Install a newer version with breaking changes
Cause code that worked previously to fail

For example:

Today your code works with AWS provider 5.0
Tomorrow Terraform installs 6.0 automatically
Your configuration may break
Real-World Example

Suppose your team uses:

resource "aws_instance" "web" {
  instance_type = "t2.micro"
}

If no version is specified, different team members may use different AWS provider versions, which can lead to inconsistent behavior.

With required_providers, everyone uses the same compatible version.

Benefits
Downloads the correct provider automatically
Ensures consistent versions across environments
Prevents unexpected breaking changes
Makes builds reproducible
Supports team collaboration
Difference Between required_providers and provider
required_providers

Defines dependencies and version constraints.

provider

Supplies configuration such as region and credentials.

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}



Storing Terraform State in a Remote Location

Storing terraform.tfstate remotely is a best practice for team environments. It centralizes state, enables locking, and improves security.

Why Store State Remotely?

Remote state provides:

Centralized access for all team members
State locking to prevent concurrent changes
Versioning and backup
Encryption and access control
Reduced risk of state loss

Common Remote Backends
Amazon Web Services Amazon S3
Azure Blob Storage
Google Cloud Storage
Terraform Cloud

Example: Remote State in Amazon S3
terraform {
  backend "s3" {
    bucket = "my-terraform-state-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}

This stores the state file in an S3 bucket under the path dev/terraform.tfstate.



🔧 What Provisioners Do

Provisioners let you:

Run shell commands (e.g., install packages)
Copy files to a server
Execute scripts after a resource is created

They are typically used when:

You need quick bootstrapping
No better tool (like configuration management) is available
⚠️ Important Note

Provisioners are considered a last resort in Terraform because:

They are not idempotent (harder to track state)
They can cause unpredictable failures
They break Terraform’s declarative model

Prefer tools like:

Cloud-init / user_data
Configuration management tools (Ansible, Chef)
📦 Types of Provisioners
1. local-exec

Runs a command on the machine where Terraform is executed.

resource "null_resource" "example" {
  provisioner "local-exec" {
    command = "echo Hello from Terraform"
  }
}
2. remote-exec

Runs commands on a remote resource (e.g., VM) via SSH or WinRM.

resource "aws_instance" "example" {
  ami           = "ami-123456"
  instance_type = "t2.micro"

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("key.pem")
    host        = self.public_ip
  }
}
3. file

Copies files from local machine to remote resource.

provisioner "file" {
  source      = "app.conf"
  destination = "/etc/app.conf"
}
🔄 When Provisioners Run
Creation time (default) → After resource is created
Destroy time → When resource is destroyed

Example:

provisioner "local-exec" {
  when    = destroy
  command = "echo Resource is being destroyed"
}
🔐 Connection Block

For remote provisioners, you must define how to connect:

connection {
  type        = "ssh"
  user        = "ec2-user"
  private_key = file("key.pem")
  host        = self.public_ip
}
🚫 Best Practices
Avoid provisioners when possible
Use user_data or cloud-init for VM setup
Keep scripts simple and repeatable
Handle failures gracefully (on_failure = continue if needed)
🧠 Summary

Provisioners:

Are imperative add-ons in a declarative system
Help execute scripts during resource lifecycle
Should be used sparingly and carefully

If you want, I can show a real-world Terraform project using provisioners vs cloud-init so you can see when each makes sense.