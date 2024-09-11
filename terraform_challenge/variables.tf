#Variables for EC2_Instance

variable "aws_region" {
  description = "This is the region in which our resources are placed"
  default = "us-east-1"
}

variable "ami" {
  description = "AMI used is ubuntu with SQL"
  default = "ami-032346ab877c418af"
}

variable "ec2_instance_type" {
  description = "The instace used is t2.micro"
 default = "t2.micro"
}


#Variables for RDS
variable "rds_username" {
  default = "admin"
}

variable "rds_password" {
  default = "ProblemWin01"
}

variable "rds_storage" {
  default = 10
}