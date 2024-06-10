
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
  name                        = "jenkins"
  attributes                  = ["ec2"]

  ssh_key_pair                = "jk-ecs-ssh-key"

  vpc_id                      = dependency.vpc.outputs.vpc_id
  subnet                      = dependency.public_basics_subnet.outputs.az_subnet_ids["us-west-2a"]
  security_group_enabled      = false
  security_groups             = [dependency.sg_bastion.outputs.id]
  assign_eip_address          = false
  associate_public_ip_address = true
  instance_type               = "m7i-flex.xlarge"
  root_volume_type            = "gp3"
  ami                         = "ami-0eb9d67c52f5c80e5" #us-west-2 regions ami id
  ami_owner                   = "amazon"

  #instance_profile            = [dependency.role.outputs.instance_profile]
}