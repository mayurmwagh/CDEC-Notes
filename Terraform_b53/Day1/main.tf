resource "aws_iam_user" "Accont" {
  name = "Accountant"
  path = "/system/"

  tags = {
    Team = "Finance"
  }
}

resource "aws_iam_user" "dev" {
  name = "Developer"
  path = "/system/"

  tags = {
    Team = "Development"
  }
}

resource "aws_iam_user" "tester" {
  name = "tester"
  path = "/system/"

  tags = {
    Team = "Testing"
  }
}

resource "aws_iam_user_policy_attachment" "user_policy" {
  user       = aws_iam_user.dev.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

}

resource "aws_iam_user_policy_attachment" "policy" {
  user       = aws_iam_user.Accont.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ReadOnlyAccess"

}

resource "aws_iam_user_policy_attachment" "attach" {
  user       = aws_iam_user.tester.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonDynamoDBReadOnlyAccess"

}

resource "aws_iam_group" "developers" {
  name = "CBZ"
  path = "/engineering/"
}

resource "aws_iam_group_membership" "developers" {
  name  = "developers-group-membership"
  group = aws_iam_group.developers.name
  users = [
    aws_iam_user.dev.name,
    aws_iam_user.tester.name
  ]
}


resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-budfdscket-name-2026"

  tags = {
    Name        = "My Bucket"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}


resource "aws_instance" "web" {
  ami             = "ami-091138d0f0d41ff90" # Amazon Linux 2
  instance_type   = "t3.micro"
  security_groups = [aws_security_group.web_sg.name]
  tags = {
    Name = "WebServer"
  }
}


resource "aws_security_group" "web_sg" {
  name        = "web-security-group"
  description = "Allow HTTP/HTTPS and SSH traffic"
  vpc_id      = "vpc-02dddddfa57c319f7"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress is required if you want to override the default "allow all"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}   