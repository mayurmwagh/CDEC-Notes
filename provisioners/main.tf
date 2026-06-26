
provider "aws" {
    region = "us-east-1"
    profile = "CDEC-B53"
}

data "aws_ami" "ubuntu_24_04" {
  most_recent = true
  owners      = ["099720109477"] # Canonical

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu_24_04.id
  instance_type = "t2.micro"
  key_name      = "id_rsa"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  # Connection block is required for remote-exec
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/id_rsa")
    host        = self.public_ip
  }

  # Executes inside the remote EC2 instance
  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx"
    ]
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow-ssh-for-provisioner"
  description = "Allow inbound SSH traffic for deployment"
  vpc_id      = "vpc-06fe0a2d50a90e1aa"

  ingress {
    description = "SSH from my current IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Replace with your actual local public IP
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}