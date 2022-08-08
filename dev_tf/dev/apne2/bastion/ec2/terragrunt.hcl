
terraform {
  source = "../../../../modules/ec2"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

dependency "vpc" {
  config_path = "../../network/service/vpc"
}

dependency "public_basics_subnet" {
  config_path = "../../network/service/subnet/public/basics"
}

dependency "sg_bastion" {
  config_path = "../sg"
}

dependency "role" {
  config_path = "../role"
}

inputs = {
  name                        = "bastion"
  attributes                  = ["ec2"]

  ssh_key_pair                = "spoon_development_ssh_key"

  vpc_id                      = dependency.vpc.outputs.vpc_id
  subnet                      = dependency.public_basics_subnet.outputs.az_subnet_ids["ap-northeast-2a"]
  security_group_enabled      = false
  security_groups             = [dependency.sg_bastion.outputs.id]
  assign_eip_address          = false
  associate_public_ip_address = true
  instance_type               = "t3.micro"
  root_volume_type            = "gp3"
  ami                         = "ami-01711d925a1e4cc3a" #Amazon Linux 2 Kernel 5.10 AMI 2.0.20220719.0 x86_64 HVM gp2
  ami_owner                   = "amazon"

  instance_profile            = [dependency.role.outputs.instance_profile]
}