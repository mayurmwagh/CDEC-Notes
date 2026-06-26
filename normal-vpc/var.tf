variable "VPC_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "enable_dns_support" {
    type = bool
    default  = true
}

variable "enable_dns_hostnames" {
    type = bool
    default = true
}


variable "instance_tenancy" {
    type = string 
    default = "default"
}

variable "namespace" {
    type  = string
    default = "dev"
}

variable "public_subnet" {
    type = list
    default = ["10.0.5.0/24","10.0.6.0/24"]
  
}

variable "private_subnet" {
    type = list
    default = ["10.0.3.0/24","10.0.4.0/24"]
  
}