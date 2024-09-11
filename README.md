#About the Project
This is an Terraform project to build infrastructure in AWS
We have built an Webserver with RDS instance along with some set of security groups,

#Resourses used
EC2_Instance - m5.large
RDS_Instance - db.t3.micro
VPC - default VPC
Subnet - default subnets
Security Group:
         ec2 - inbound port 80 and 22 are only allowed
               outbound all traffic allowd
         RDS - inbound traffic from ec2 security group
               outbound any
#Pre-Requisites
Need to install Terrafrom
Need to install AWS CLI
Configure AWS CLI with Access and Secret Key
Make sure the account used to configure has proper IAM roles

#Configuration files
GIT_HUB repo - https://github.com/RubhanRV/terraform_challenge
Please use above link to fetch the files.

main.tf - It consist of all resourse configuration 
variables.tf - The information which cannot be hardcoded are used here for modularity
.tfvars(optional) - Can use to get high modularity and Reusabilty
                    (users can provide info/configuration req)
outputs.tf - Displays necessary info like ec2 _public_ip
             Displays RDS endpoint to connect

#How to Deploy
**CD to the directory where   the config files are present
 1) terraform init - This initializes the backend(.tfstate file) and the terraform fetches fundamental info like provider to deploy.
 2) terraform validate - Checks for syntax error and assist us on the same.
 3) terraform plan - It is an pre-run before actually deploying the infra, so that we can revise it and deploy confidently.
 4) terraform apply - This deploys the infrastructurte in the cloud provider

###########################################################################################
# NOTE: AS PER THE AMI PROVIDED IN TEST DOES NOT SUPPORT "t2.micro" hence using m5.large  #
#        SAME FOR THE RDS INSTANCE, USING "db.t3.micro"                                   #
###########################################################################################
###################################################### OUTPUT ##################################################################################################################################
  ***terraform init:***

    rubhanrv@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge$ cd terraform_challenge/
rubhanrv@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge/terraform_challenge$ ls
main.tf  outputs.tf  variables.tf
rubhanrv@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge/terraform_challenge$ terraform init
Initializing the backend...
Initializing provider plugins...
- Finding latest version of hashicorp/aws...
- Installing hashicorp/aws v5.66.0...
- Installed hashicorp/aws v5.66.0 (signed by HashiCorp)
Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.

***terraform validate***
  rubhanrv@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge/terraform_challenge$ terraform validate
Success! The configuration is valid.

***terraform plan***
#Make sure to provide IAM role of using EC2.

root@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge/terraform_challenge# terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_db_instance.webserver_db01 will be created
  + resource "aws_db_instance" "webserver_db01" {
      + address                               = (known after apply)
      + allocated_storage                     = 10
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_target                         = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = "mydb"
      + db_subnet_group_name                  = (known after apply)
      + dedicated_log_volume                  = false
      + delete_automated_backups              = true
      + domain_fqdn                           = (known after apply)
      + endpoint                              = (known after apply)
      + engine                                = "mysql"
      + engine_lifecycle_support              = (known after apply)
      + engine_version                        = "8.0"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = (known after apply)
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t2.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = "default.mysql8.0"
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "admin"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_instance.webserver will be created
  + resource "aws_instance" "webserver" {
      + ami                                  = "ami-032346ab877c418af"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = "c77b38c8eb468c2da92287a3b8ce7b4d4588b39b"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_security_group.rds_sg will be created
  + resource "aws_security_group" "rds_sg" {
      + arn                    = (known after apply)
      + description            = "this security group open port 3306 and allows traffic from webserver_SG"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + from_port        = 3306
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 3306
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.webserver_SG will be created
  + resource "aws_security_group" "webserver_SG" {
      + arn                    = (known after apply)
      + description            = "allows port 22 and 80 for inbound and all traffic for outbound"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:                               yes
  + db_storage         = 10
  + db_username        = "admin"
  + websever_public_IP = (known after apply)

***terraform apply***
(advised not to use force)

root@RRubhanV:/mnt/c/Users/Tony/Desktop/terraform_challenge/terraform_challenge/terraform_challenge# terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:   
  + create

Terraform will perform the following actions:

  # aws_db_instance.webserver_db01 will be created
  + resource "aws_db_instance" "webserver_db01" {
      + address                               = (known after apply)
      + allocated_storage                     = 10
      + apply_immediately                     = false
      + arn                                   = (known after apply)
      + auto_minor_version_upgrade            = true
      + availability_zone                     = (known after apply)
      + backup_retention_period               = (known after apply)
      + backup_target                         = (known after apply)
      + backup_window                         = (known after apply)
      + ca_cert_identifier                    = (known after apply)
      + character_set_name                    = (known after apply)
      + copy_tags_to_snapshot                 = false
      + db_name                               = "mydb"
      + db_subnet_group_name                  = (known after apply)
      + dedicated_log_volume                  = false
      + delete_automated_backups              = true
      + domain_fqdn                           = (known after apply)
      + endpoint                              = (known after apply)
      + engine                                = "mysql"
      + engine_lifecycle_support              = (known after apply)
      + engine_version                        = "8.0"
      + engine_version_actual                 = (known after apply)
      + hosted_zone_id                        = (known after apply)
      + id                                    = (known after apply)
      + identifier                            = (known after apply)
      + identifier_prefix                     = (known after apply)
      + instance_class                        = "db.t3.micro"
      + iops                                  = (known after apply)
      + kms_key_id                            = (known after apply)
      + latest_restorable_time                = (known after apply)
      + license_model                         = (known after apply)
      + listener_endpoint                     = (known after apply)
      + maintenance_window                    = (known after apply)
      + master_user_secret                    = (known after apply)
      + master_user_secret_kms_key_id         = (known after apply)
      + monitoring_interval                   = 0
      + monitoring_role_arn                   = (known after apply)
      + multi_az                              = (known after apply)
      + nchar_character_set_name              = (known after apply)
      + network_type                          = (known after apply)
      + option_group_name                     = (known after apply)
      + parameter_group_name                  = "default.mysql8.0"
      + password                              = (sensitive value)
      + performance_insights_enabled          = false
      + performance_insights_kms_key_id       = (known after apply)
      + performance_insights_retention_period = (known after apply)
      + port                                  = (known after apply)
      + publicly_accessible                   = false
      + replica_mode                          = (known after apply)
      + replicas                              = (known after apply)
      + resource_id                           = (known after apply)
      + skip_final_snapshot                   = true
      + snapshot_identifier                   = (known after apply)
      + status                                = (known after apply)
      + storage_throughput                    = (known after apply)
      + storage_type                          = (known after apply)
      + tags_all                              = (known after apply)
      + timezone                              = (known after apply)
      + username                              = "admin"
      + vpc_security_group_ids                = (known after apply)
    }

  # aws_instance.webserver01 will be created
  + resource "aws_instance" "webserver01" {
      + ami                                  = "ami-032346ab877c418af"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "m5.large"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = (known after apply)
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags_all                             = (known after apply)
      + tenancy                              = (known after apply)
      + user_data                            = "c77b38c8eb468c2da92287a3b8ce7b4d4588b39b"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_security_group.rds_sg will be created
  + resource "aws_security_group" "rds_sg" {
      + arn                    = (known after apply)
      + description            = "this security group open port 3306 and allows traffic from webserver_SG"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = []
              + from_port        = 3306
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = (known after apply)
              + self             = false
              + to_port          = 3306
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

  # aws_security_group.webserver_SG will be created
  + resource "aws_security_group" "webserver_SG" {
      + arn                    = (known after apply)
      + description            = "allows port 22 and 80 for inbound and all traffic for outbound"
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
                # (1 unchanged attribute hidden)
            },
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
                # (1 unchanged attribute hidden)
            },
        ]
      + name                   = (known after apply)
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags_all               = (known after apply)
      + vpc_id                 = (known after apply)
    }

Plan: 4 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + db_storage         = "aws_db_instance.webserver_db01.allocated_storage"
  + db_username        = "aws_db_instance.webserver_db01.username"
  + websever_public_IP = "aws_instance.webserver01.public_ip"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_security_group.webserver_SG: Creating...
aws_security_group.webserver_SG: Creation complete after 9s [id=sg-0ddd271d10894ffab]
aws_security_group.rds_sg: Creating...
aws_instance.webserver01: Creating...
aws_security_group.rds_sg: Creation complete after 6s [id=sg-0b1281436fa2544ce]
aws_db_instance.webserver_db01: Creating...
aws_instance.webserver01: Still creating... [10s elapsed]
aws_instance.webserver01: Creation complete after 15s [id=i-0d854f101c2a85231]
aws_db_instance.webserver_db01: Still creating... [10s elapsed]
aws_db_instance.webserver_db01: Still creating... [20s elapsed]
aws_db_instance.webserver_db01: Still creating... [30s elapsed]
aws_db_instance.webserver_db01: Still creating... [40s elapsed]
aws_db_instance.webserver_db01: Still creating... [50s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m0s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m10s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m20s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m30s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m40s elapsed]
aws_db_instance.webserver_db01: Still creating... [1m50s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m0s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m10s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m20s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m30s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m40s elapsed]
aws_db_instance.webserver_db01: Still creating... [2m50s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m0s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m10s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m20s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m30s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m40s elapsed]
aws_db_instance.webserver_db01: Still creating... [3m50s elapsed]
aws_db_instance.webserver_db01: Still creating... [4m0s elapsed]
aws_db_instance.webserver_db01: Still creating... [4m10s elapsed]
aws_db_instance.webserver_db01: Still creating... [4m20s elapsed]
aws_db_instance.webserver_db01: Creation complete after 4m28s [id=db-QIK2XT4P7IPYMHERT7OE5KKOYM]

Apply complete! Resources: 4 added, 0 changed, 0 destroyed.

Outputs:

db_storage = 10  #output has been printed as expected
db_username = "admin"
websever_public_IP = "44.220.161.177"





