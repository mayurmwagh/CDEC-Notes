
variables: 

    1. string 

    variable.tf 

    variable "ami_id" {
        type = string
        default = "ami-342kkdnwerw"
    }
    
    2. list 
    variable "instance_types"{
        type = List
        default = ['value1', 'value2', 'value3', 'value4']
    }
    
    3. Map
    variable "tags" {
        typs= map
        default {
            name = "dev"
            team = "development"
            company = "tcs" 
        }
    }
    
    4. boolean 
    variable "public_ip" {
        type = bool
        default = true
    } 



variable.tf 
    variable "instance_types"{
        type = List
        default = ['value1', 'value2', 'value3', 'value4']
                      0         1          2        3  
    }


resource "aws_instance" "web" {
    ami = var.ami_id
    instance_type = var.instance_type
}