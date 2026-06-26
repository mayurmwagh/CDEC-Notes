variable "VPC_cidr" {
  type = string

}

variable "enable_dns_support" {
  type = bool

}

variable "enable_dns_hostnames" {
  type = bool
}

variable "instance_tenancy" {
  type = string

}

variable "public_subnet1" {
  type = string

}

variable "public_subnet2" {
  type = string

}

variable "map_public_ip_on_launch" {
  type = bool

}

variable "private_subnet1" {
  type = string

}

variable "private_subnet2" {
  type = string

}

variable "namespace" {
  type = string
}