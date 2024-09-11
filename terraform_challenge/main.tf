provider "aws" {
  region = var.aws_region
}

#sg for EC2

resource "aws_security_group" "webserver_SG" {
  #name = "webserver_security_group"
  description = "allows port 22 and 80 for inbound and all traffic for outbound"


    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }       

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

    }

}

#EC2 Instance with httpd server

resource "aws_instance" "webserver01" {
        ami = var.ami
        instance_type = var.ec2_instance_type
        vpc_security_group_ids = [aws_security_group.webserver_SG.id]

        user_data = <<-EOF
                    #!/bin/bash
                    sudo apt update
                    sudo apt install httpd -y
                    sudo systemctl start httpd
                    sudo systemctl enable httpd
                    EOF
}                    

#SG for DB
resource "aws_security_group" "rds_sg" {
  description = "this security group open port 3306 and allows traffic from webserver_SG"

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.webserver_SG.id]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

#DB instance

resource "aws_db_instance" "webserver_db01" {
    allocated_storage    = var.rds_storage
    db_name              = "mydb"
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = var.rds_instance_type
    username             = var.rds_username
    password             = var.rds_password
    parameter_group_name = "default.mysql8.0"
    vpc_security_group_ids = [aws_security_group.rds_sg.id]
    skip_final_snapshot  = true
}
  
