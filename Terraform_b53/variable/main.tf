
resource "aws_instance" "web" {
    ami           = var.ami_id 
    instance_type = var.instance_type[2]
    subnet_id = var.subnet_id
    key_name = var.key_name
    tags= var.tags
  
}

resource "aws_security_group" "sg"{
    name = var.sg_name
    description = var.description
    vpc_id = var.vpc_id

    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = var.sg_tags
}