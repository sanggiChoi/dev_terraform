
terraform {
  source = "../../../../modules/iam/role"
}

terraform_version_constraint = ">= 0.12"

include {
  path = "${find_in_parent_folders()}"
}

dependencies {
  paths = []
}

inputs = {
  name                        = "jenkins"
  attributes                  = ["ec2", "role"]

  role_description            = "jenkins ec2 role"

  managed_policy_arns					= [
    "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
    "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  ]
  policy_document_count       = 0

  assume_role_actions					= ["sts:AssumeRole"]
  principals = {
    Service = ["ec2.amazonaws.com"]
  }

  tags_enabled                = true

  instance_profile_enabled    = true
}