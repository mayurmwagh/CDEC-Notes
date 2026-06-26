variable "ami_id"{
    type = string
    default = "ami-0c94855ba95c71c99"
}

variable "instance_type" {
    type = list(string)
    default = ["t2.micro", "t3.micro", "c7i-flex.large"]
}

variable "subnet_id" {
    type = string
    default = "subnet-03f634ea175fc8ee9"
  
}
variable "key_name" {
    type = string
    default = "id_rsa"
  
}

variable "tags" {
    type = map
    default = {
        Name = "webserver"
        pourpose = "Application testing"
        enddate = "13/6/2026"
    }
}

variable "sg_name" {
    type = string
    default = "webserver_sg"
}

variable "description" {
    type = string
    default = "this is webserversg"
}

variable "vpc_id" {
    type = string
    default = "vpc-02dddddfa57c319f7"
}

variable "sg_tags"{
    type = map
    default = {
        Name = "webserver_sg"
        pourpose = "Application"
        enddate = "13/6/2026"
    }
}