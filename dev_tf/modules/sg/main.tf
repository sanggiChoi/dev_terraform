provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

module "sg" {
  source                            = "cloudposse/security-group/aws"
  version                           = "1.0.1"

	target_security_group_id					= var.target_security_group_id
	security_group_name								= var.security_group_name
	security_group_description				= var.security_group_description
	create_before_destroy							= var.create_before_destroy
	allow_all_egress									= var.allow_all_egress
	rules															= var.rules
	rules_map													= var.rules_map
	rule_matrix												= var.rule_matrix
	security_group_create_timeout			= var.security_group_create_timeout
	security_group_delete_timeout			= var.security_group_delete_timeout
	revoke_rules_on_delete						= var.revoke_rules_on_delete
	vpc_id														= var.vpc_id
	inline_rules_enabled							= var.inline_rules_enabled

	context 													= module.this.context	
}