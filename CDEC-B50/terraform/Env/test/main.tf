module "VPC" {
     source = "../../module/vpc"
     vpc_cidr = "10.0.0.0/16"
     instance_tenancy = "default"
     public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
     namespace = "test"
     private_subnet_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
}