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