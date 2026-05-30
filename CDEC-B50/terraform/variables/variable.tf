# variable "ami_id" {
#   type = string
#   default = "ami-0de864d6a3bd20ea8"
# }

variable "instance_type" {
  type = list(string)
  default = ["t3.micro", "t2.small", "t2.medium"]
}

variable "associate_public_ip" {
    type = bool
    default = true
  
}

variable "avaibility_zone" {
    type = string
    default = "eu-west-1b"
}

variable "key_name" {
    type = string
    default = "Id_rsa"
  
}

variable "tags" {
    type = map(string)
    default = {
        Name = "webserver"
        Environment = "Production"
        Enddate = "2024-12-31"
    }
  
}

variable "sg_name" {
    type = string
    default = "webserver-sg"
  
}

variable "sg_descitption" {
    type = string
    default = "Security group for web server"
  
}

# variable "vpc_id" {
#     type = string
#     default = "vpc-011000514adfc21b4"
  
# }

variable "sg_tags" {
    type = map(string)
    default = {
        Name = "webserver-sg"
        Environment = "Production"
        Enddate = "2024-12-31"
    }
  
}