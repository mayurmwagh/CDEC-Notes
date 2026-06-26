provider "aws" {
  region = var.aws_region
  profile = "CDEC-B53"
}

# Fetch Latest Amazon Linux 2023 AMI
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }
}

# Launch Template using variables
resource "aws_launch_template" "asg_template" {
  name_prefix   = "${var.environment}-launch-template-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  lifecycle {
    create_before_destroy = true
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Environment = var.environment
      Name        = "${var.environment}-asg-worker"
    }
  }
}

# Auto Scaling Group using variables
resource "aws_autoscaling_group" "app_asg" {
  name_prefix         = "${var.environment}-asg-"
  min_size            = var.asg_config.min_size
  max_size            = var.asg_config.max_size
  desired_capacity    = var.asg_config.desired_capacity
  vpc_zone_identifier = var.vpc_subnet_ids

  launch_template {
    id      = aws_launch_template.asg_template.id
    version = "$Latest"
  }

  lifecycle {
    ignore_changes        = [desired_capacity]
    create_before_destroy = true
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
}

# Scaling Policy
resource "aws_autoscaling_policy" "cpu_scaling_policy" {
  name                   = "${var.environment}-cpu-scaling"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 50.0
  }
}



resource "aws_security_group" "alb_sg" {
  name_prefix = "${var.environment}-alb-sg-"
  vpc_id      = var.vpc_id

  ingress {
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
}


resource "aws_lb" "external_alb" {
  name               = "${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.public_subnet_ids # ALB needs public subnets to face the internet

  tags = {
    Environment = var.environment
  }
}

# 3. ALB Target Group (The routing destination)
resource "aws_lb_target_group" "app_tg" {
  name     = "${var.environment}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.external_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}
