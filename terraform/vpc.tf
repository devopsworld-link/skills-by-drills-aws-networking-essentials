locals {
  network_acls = {
    default_inbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 1024
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    default_outbound = [
      {
        rule_number = 900
        rule_action = "allow"
        from_port   = 32768
        to_port     = 65535
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    public_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = -1
        protocol    = "icmp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    public_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = "0.0.0.0/0"
      },
      {
        rule_number = 110
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = -1
        protocol    = "icmp"
        cidr_block  = "0.0.0.0/0"
      },
    ]
    private_inbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = var.vpc_cidr_block
      },
      {
        rule_number = 110
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = -1
        protocol    = "icmp"
        cidr_block  = var.vpc_cidr_block
      },
    ]
    private_outbound = [
      {
        rule_number = 100
        rule_action = "allow"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_block  = var.vpc_cidr_block
      },
      {
        rule_number = 110
        rule_action = "allow"
        icmp_code   = -1
        icmp_type   = -1
        protocol    = "icmp"
        cidr_block  = var.vpc_cidr_block
      },
    ]
  }
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = var.vpc_cidr_block

  azs             = ["${var.region}a", "${var.region}b"]
  public_subnets  = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets

  public_subnet_names  = ["Public Subnet"]
  private_subnet_names = ["Private Subnet 1", "Private Subnet 2"]

  public_dedicated_network_acl  = true
  public_inbound_acl_rules      = concat(local.network_acls["default_inbound"], local.network_acls["public_inbound"])
  public_outbound_acl_rules     = concat(local.network_acls["default_outbound"], local.network_acls["public_outbound"])

  private_dedicated_network_acl = true
  private_inbound_acl_rules     = concat(local.network_acls["default_inbound"], local.network_acls["private_inbound"])
  private_outbound_acl_rules    = concat(local.network_acls["default_outbound"], local.network_acls["private_outbound"])

  enable_nat_gateway = true
  single_nat_gateway = true

}