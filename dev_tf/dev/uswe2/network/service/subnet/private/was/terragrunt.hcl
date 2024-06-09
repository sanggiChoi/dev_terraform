
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

dependency "public_basics_subnet" {
  config_path = "../../public/basics"
}

inputs = {
  name        = "was"
  attributes  = ["subnet"] 
  cidr_block  = "172.16.16.0/21"
  vpc_id      = dependency.vpc.outputs.vpc_id
  type        = "private"
  az_ngw_ids  = dependency.public_basics_subnet.outputs.az_ngw_ids
}