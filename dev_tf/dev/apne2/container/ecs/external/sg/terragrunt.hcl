
terraform {
  source = "../../../../../../modules/sg"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

dependency "vpc" {
  config_path = "../../../../network/service/vpc"
}

inputs = {
  name          = "ecs-external"
  attributes    = ["sg"]

  vpc_id        = dependency.vpc.outputs.vpc_id
  instance_profile_enabled = true
}