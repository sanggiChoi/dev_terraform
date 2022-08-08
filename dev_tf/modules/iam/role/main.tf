provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

module "role" {
  source                      = "cloudposse/iam-role/aws"
  version											= "0.16.2"

	use_fullname								= var.use_fullname
	principals									= var.principals
	policy_documents						= var.policy_documents
	policy_document_count				= var.policy_document_count
	managed_policy_arns					= var.managed_policy_arns
	max_session_duration				= var.max_session_duration
	permissions_boundary				= var.permissions_boundary
	role_description						= var.role_description
	policy_description					= var.policy_description
	assume_role_actions					= var.assume_role_actions
	assume_role_conditions			= var.assume_role_conditions
	instance_profile_enabled		= var.instance_profile_enabled
	path												= var.path
	tags_enabled								= var.tags_enabled

	context 										= module.this.context	
}