module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name           = "my-key"
  create_private_key = true
}


resource "local_file" "private_key" {
  content         = module.key_pair.private_key_pem
  filename        = "ssh_key.pem"
  file_permission = "0400"
}