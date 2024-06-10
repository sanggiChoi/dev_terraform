
terraform {
  source = "../../../../modules/sg"
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

inputs = {
  name          = "jenkins"
  attributes    = ["sg"]

  vpc_id        = dependency.vpc.outputs.vpc_id
  instance_profile_enabled = true
  
  rules_map = {
    ingress = [{
      key         = "ingress"
      type        = "ingress"
      from_port   = 0
      to_port     = 65535
      protocol    = "tcp"
      cidr_blocks = ["35.90.112.46/32"]
      self        = null
      description = "can access c9 public ip"
    }]
  }
}