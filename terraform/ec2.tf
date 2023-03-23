locals {
  multiple_instances = {
    private_1 = {
      instance_type     = var.ec2_instance_type
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.private_subnets, 0)
      security_group_id = module.private_sg.security_group_id  
    }
    private_2 = {
      instance_type     = var.ec2_instance_type
      availability_zone = element(module.vpc.azs, 1)
      subnet_id         = element(module.vpc.private_subnets, 1)
      security_group_id = module.private_sg.security_group_id
    }
    public = {
      instance_type     = var.ec2_instance_type
      availability_zone = element(module.vpc.azs, 0)
      subnet_id         = element(module.vpc.public_subnets, 0)
      security_group_id = module.public_sg.security_group_id
    }
  }
}


module "ec2_multiple" {
  source = "terraform-aws-modules/ec2-instance/aws"

  for_each = local.multiple_instances

  name = "${each.key}"

  ami_ssm_parameter      = var.ami_id_ssm_parameter
  instance_type          = each.value.instance_type
  availability_zone      = each.value.availability_zone
  subnet_id              = each.value.subnet_id
  vpc_security_group_ids = [each.value.security_group_id]
  key_name               = module.key_pair.key_pair_name
}
