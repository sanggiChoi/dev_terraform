
terraform {
  source = "../../../../../modules/vpc"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

inputs = {
  name                              = "vpc-service"
  ipv4_primary_cidr_block           = "172.16.0.0/16"
  igw_enabled                       = true
}