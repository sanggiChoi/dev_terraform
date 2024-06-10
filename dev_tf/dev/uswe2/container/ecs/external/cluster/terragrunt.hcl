
terraform {
  source = "../../../../../../modules/ecs-cluster"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

dependency "private_was_subnet" {
  config_path = "../../../../network/service/subnet/private/was"
}

dependency "ecs_external_sg" {
  config_path = "../sg"
}

inputs = {
  name        = "ecs-external"
  attributes  = ["cluster"] 
  
  container_insights_enabled      = true
  #capacity_providers_fargate      = true
  #capacity_providers_fargate_spot = true
  
  capacity_providers_ec2 = {
    ec2_default = {
      instance_type               = "t3.medium"
      security_group_ids          = [dependency.ecs_external_sg.outputs.id]
      subnet_ids                  = [
        lookup(dependency.private_was_subnet.outputs.az_subnet_ids, "us-west-2a"),
        lookup(dependency.private_was_subnet.outputs.az_subnet_ids, "us-west-2b"),
        lookup(dependency.private_was_subnet.outputs.az_subnet_ids, "us-west-2c")
      ]
      associate_public_ip_address = false
      min_size                    = 3
      max_size                    = 6
    }
  }
}