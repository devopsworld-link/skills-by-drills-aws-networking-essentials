module "public_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name                = "Public SG"
  description         = "Security group for EC2 instances in public subnets"
  vpc_id              = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["ssh-tcp", "all-icmp"]

  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}


module "private_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "Private SG"
  description = "Security group for EC2 instances in private subnets"
  vpc_id      = module.vpc.vpc_id

  ingress_with_source_security_group_id = [
    {
      rule                     = "ssh-tcp"
      source_security_group_id = module.public_sg.security_group_id
    },
    {
      rule                     = "all-icmp"
      source_security_group_id = module.public_sg.security_group_id
    }
  ]

  ingress_with_self = [
    {
      rule = "all-all"
    }
  ]

  egress_cidr_blocks  = ["0.0.0.0/0"]
  egress_rules        = ["all-all"]
}