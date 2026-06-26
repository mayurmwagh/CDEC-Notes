
resource "aws_instance" "web" {
  ami                    = var.ami_id # Amazon Linux 2
  instance_type          = var.instance_type
  key_name               = var.key_name
  user_data              = <<-EOF
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl start nginx
EOF
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = {
    Name = "${var.namespace}-WebServer"
  }
}

resource "aws_security_group" "web_sg" {
  name        = var.sg_name
  description = var.sg_disctiption
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
    Name = "${var.namespace}-WebSecurityGroup"
  }
}