
terraform {
  source = "../../../../../../../modules/subnet"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

dependency "vpc" {
  config_path = "../../../vpc"
}

inputs = {
  name                = "basics"
  attributes          = ["subnet"] 
  cidr_block          = "172.16.0.0/21"
  vpc_id              = dependency.vpc.outputs.vpc_id
  type                = "public"
  igw_id              = dependency.vpc.outputs.igw_id
  nat_gateway_enabled = "true"
}