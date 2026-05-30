variable "vpc_cidr" {
    type = string
  
}

variable "instance_tenancy" {
    type = string
  
}



variable "public_subnet_cidr" {
    type = list(string)

}

variable "namespace" {
    type = string
}


variable "private_subnet_cidr" {
    type = list(string) 
  
}

