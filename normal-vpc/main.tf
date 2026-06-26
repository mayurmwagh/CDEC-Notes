provider "aws" {
    region = "us-east-1"
    profile = "CDEC-B53"
}

resource "aws_vpc" "main" {
  cidr_block           = var.VPC_cidr
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  instance_tenancy     = var.instance_tenancy
  tags = {
    Name = "${var.namespace}-VPC"
  }
}


resource "aws_subnet" "public"{
    count = length(var.public_subnet)
    vpc_id = aws_vpc.main.id 
    cidr_block = element(var.public_subnet, count.index)
    tags = {
        Name = "Public-subnet ${count.index + 1}"
    }
}

resource "aws_subnet" "private"{
    count = length(var.private_subnet)
    vpc_id = aws_vpc.main.id 
    cidr_block = element(var.private_subnet, count.index)
    tags = {
        Name = "Private-subnet ${count.index + 1}"
    }
}

