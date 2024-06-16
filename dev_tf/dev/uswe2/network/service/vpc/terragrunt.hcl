
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
  ipv4_primary_cidr_block           = "10.50.208.0/20"
  internet_gateway_enabled          = false
  assign_generated_ipv6_cidr_block  = false
}