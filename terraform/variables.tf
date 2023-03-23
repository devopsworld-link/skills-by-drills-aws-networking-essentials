variable "region" {
  description = "AWS region where resources should be created"
  type        = string
  default     = ""
}

variable "vpc_cidr_block" {
  description = "IP address range for VPC"
  type        = string
  default     = ""
}

variable "vpc_public_subnets" {
  description = "Public subnets to be created in VPC"
  type        = list(string)
  default     = []
}

variable "vpc_private_subnets" {
  description = "Private subnets to be created in VPC"
  type        = list(string)
  default     = []
}

variable "ami_id_ssm_parameter" {
  description = "SSM parameter to reference latest AMI ID for EC2 instances"
  type        = string
  default     = ""
}

variable "ec2_instance_type" {
  description = "Type of the EC2 instances"
  type        = string
  default     = ""
}