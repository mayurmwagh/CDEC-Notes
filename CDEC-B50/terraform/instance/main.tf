# Create an EC2 Instance

terraform {
  backend "s3" {
    bucket = "demo-newbucket-terraform"
    key    = "dev/terraform.tfstate"
    region = "eu-west-1"
    profile = "CDEC-B50"
  }
}


resource "aws_instance" "my_instance" {
  ami             = "ami-0c13c2049f369d641"
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.my_sg.name]

  tags = {
    Name        = "MyTerraformInstance"
    Environment = "Dev"
  }
}

# Create a Security Group
resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Allow SSH, HTTP, and HTTPS traffic"

  # Allow SSH (Port 22) from anywhere
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (Port 80) from anywhere
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTPS (Port 443) from anywhere
  ingress {
    description = "HTTPS Access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound traffic
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "MySecurityGroup"
  }
}

