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

variable "environment" {
  type        = string
  description = "The deployment environment name"
  default     = "production"
}