provider "aws" {
    region = "us-east-1"
    profile = "CDEC-B50"
}


resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = var.instance_tenancy

  tags = {
    "Name" = "${var.namespace}-VPC"
  }
}


resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    count = length(var.public_subnet_cidr)
    cidr_block = element(var.public_subnet_cidr, count.index)

    tags = {
      "Name" = "${var.namespace}-PublicSubnet ${count.index + 1}"
    }
}

  
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.main.id
    count = length(var.private_subnet_cidr)
    cidr_block = element(var.private_subnet_cidr, count.index)

    tags = {
      "Name" = "${var.namespace}-PrivateSubnet ${count.index + 1}"
    }
}
