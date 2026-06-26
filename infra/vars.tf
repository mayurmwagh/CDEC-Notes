variable "aws_region" {
  type        = string
  description = "The AWS region to deploy resources into"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "The deployment environment name"
  default     = "production"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance size for the Auto Scaling Group"
  default     = "t2.micro"
}

variable "vpc_subnet_ids" {
  type        = list(string)
  description = "A list of subnet IDs where the ASG can launch instances"
  default = ["subnet-04f834c128a6497fa", "subnet-00d2426fdc4a3b842"]  
}

variable "asg_config" {
  type = object({
    min_size         = number
    max_size         = number
    desired_capacity = number
  })
  description = "Sizing configuration for the Auto Scaling Group"
  default = {
    min_size         = 2
    max_size         = 5
    desired_capacity = 2
  }
}

variable "vpc_id" {
  type        = string
  description = "The ID of the VPC where resources will be deployed"
  default         = "vpc-06fe0a2d50a90e1aa"  
}

variable "public_subnet_ids" {
  type        = list(string)
  description = "Public subnets for the internet-facing Load Balancer"
  default = ["subnet-04f834c128a6497fa", "subnet-00d2426fdc4a3b842"]

} 