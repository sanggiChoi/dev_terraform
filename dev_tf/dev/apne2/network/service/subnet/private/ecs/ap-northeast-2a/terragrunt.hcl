
terraform {
  source = "../../../../../../../../modules/subnets/dynamic-subnets"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

dependency "vpc" {
  config_path = "../../../../vpc"
}

# dependency "public_basics_subnet" {
#   config_path = "../../public/basics"
# }

inputs = {
  name                    = "ecs-01"
  attributes              = ["subnet"]
  availability_zones      = ["ap-northeast-2a"]
  vpc_id                  = dependency.vpc.outputs.vpc_id
  ipv4_cidr_block         = ["10.50.208.0/24"]
  ipv6_enabled            = false
  nat_gateway_enabled     = false
  nat_instance_enabled    = false
  public_subnets_enabled  = false

  max_subnet_count        = 1
  subnets_per_az_count    = 1
}