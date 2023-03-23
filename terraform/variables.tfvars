region = "us-east-1"

vpc_name                 = "my-vpc"
vpc_cidr_block           = "10.0.0.0/22"
vpc_public_subnets       = ["10.0.0.0/24"]
vpc_private_subnets      = ["10.0.1.0/24", "10.0.2.0/24"]
vpc_public_subnet_names  = ["Public Subnet"]
vpc_private_subnet_names = ["Private Subnet 1", "Private Subnet 2"]

ami_id_ssm_parameter = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
ec2_instance_type    = "t3.micro"