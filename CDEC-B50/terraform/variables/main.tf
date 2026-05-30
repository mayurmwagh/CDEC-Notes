

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}



resource "aws_instance" "example" {
  ami                         = data.aws_ami.ubuntu.id # Replace with your desired AMI ID
  instance_type               = var.instance_type[0]
  associate_public_ip_address = var.associate_public_ip
  availability_zone           = var.avaibility_zone
  key_name                    = var.key_name
  security_groups             = [aws_security_group.http.name]
  user_data                   = file("install.sh")
  tags                        = var.tags
}



data "aws_vpc" "default" {
  default = true
}

resource "aws_security_group" "http" {
  name        = var.sg_name
  description = var.sg_descitption
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "SSH Port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTP Port"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}

output "public_ip" {
  value = aws_instance.example.public_ip

}   

output "private_ip" {
    value = aws_instance.example.private_ip
  
}

output "instance_id" {
    value = aws_instance.example.id
  
}   

output "public_dns" {
    value = aws_instance.example.public_dns
}