resource "aws_vpc" "main" {
  cidr_block           = var.VPC_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
  tags = {
    Name = "${var.namespace}-VPC"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet1
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.namespace}-Public Subnet"
  }
}

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet2
  map_public_ip_on_launch = var.map_public_ip_on_launch

  tags = {
    Name = "${var.namespace}-PublicSubnet2"

  }
}

resource "aws_subnet" "private_subnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet1
  tags = {
    Name = "${var.namespace}-Private Subnet"
  }
}

resource "aws_subnet" "private_subnet2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet2
  tags = {
    Name = "${var.namespace}-Private Subnet"
  }
}

# resource "aws_internet_gateway" "igw" {
#   vpc_id = aws_vpc.main.id
#   tags = {
#     Name = "main-igw"
#   }
# }

# resource "aws_route_table" "public_rt" {
#   vpc_id = aws_vpc.main.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }

#   tags = {
#     Name = "simple-public-rt"
#   }
# }

# # 6. Associate Route Table with the Subnet
# resource "aws_route_table_association" "public_assoc" {
#   subnet_id      = aws_subnet.public_subnet1.id
#   route_table_id = aws_route_table.public_rt.id
# }


resource "aws_instance" "web" {
  ami                    = "ami-091138d0f0d41ff90" # Amazon Linux 2
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.public_subnet1.id
  key_name               = "id_rsa"
  user_data              = <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl start nginx
EOF
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "WebServer"
  }
}

resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow HTTP/HTTPS and SSH traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSecurityGroup"
  }
}

