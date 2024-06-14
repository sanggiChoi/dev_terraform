
terraform {
  source = "../../../../../../../modules/subnet-named"
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
  name              = "web"
  
  subnet_names      = ["us-west-2a"]
  vpc_id            = dependency.vpc.outputs.vpc_id
  cidr_block        = "172.16.8.0/24"
  max_subnets       = 1
  type              = "private"
  availability_zone = "us-west-2a"
  ngw_id            = dependency.public_basics_subnet.outputs.az_ngw_ids["us-west-2a"]
  attributes        = ["subnet"] 
}