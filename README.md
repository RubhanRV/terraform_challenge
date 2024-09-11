#About the project
This is an Terraform project building infrastructure in AWS environment.
An webserver and an RDS instance is been deployed in AWS using HCL terraform scrips.

#Resources built with configuration
EC2 - ubuntu 20.04 LTS t2.micro
RDS - db.t2.micro
VPC - Default VPC
Subnet - Default subnet
Securuty Groups 
   EC2 - inbound ports 80 and 22 are open.
       - outbound all traffic
   RDS - inbound only from ec2 sg with ports open 3306

#Pre-Requsite
Install Terraform.
Intall AWS CLI.
configure AWS CLI from the machine to build Infrastructure.

#Please use this GIT_HUB repo for configuration files:
repo : https://github.com/RubhanRV/terraform_challenge.git
files_included 
   main.tf - Consists of HCL script to build infrastructure
   variables.tf - This fiel includes variables which can be used in main.tf for modularity
                  Can also use .tfvars to attain high re-usability
   outputs.tf - This file contains the info needed to access webserver and login RDS if needed.
