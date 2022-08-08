provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

module "ec2" {
	source 			= "cloudposse/ec2-instance/aws"
	version     = "0.43.0"

	ssh_key_pair													= var.ssh_key_pair
	associate_public_ip_address						= var.associate_public_ip_address
	assign_eip_address										= var.assign_eip_address
	user_data															= var.user_data
	user_data_base64											= var.user_data_base64
	instance_type													= var.instance_type
	burstable_mode												= var.burstable_mode
	vpc_id																= var.vpc_id
	security_group_enabled								= var.security_group_enabled
	security_groups												= var.security_groups
	security_group_description						= var.security_group_description
	security_group_use_name_prefix				= var.security_group_use_name_prefix
	security_group_rules									= var.security_group_rules
	subnet																= var.subnet
	region																= var.region
	availability_zone											= var.availability_zone
	ami																		= var.ami
	ami_owner															= var.ami_owner
	ebs_optimized													= var.ebs_optimized
	disable_api_termination								= var.disable_api_termination
	monitoring														= var.monitoring
	private_ip														= var.private_ip
	source_dest_check											= var.source_dest_check
	ipv6_address_count										= var.ipv6_address_count
	ipv6_addresses												= var.ipv6_addresses
	root_volume_type											= var.root_volume_type
	root_volume_size											= var.root_volume_size
	root_iops															= var.root_iops
	ebs_device_name												= var.ebs_device_name
	ebs_volume_type												= var.ebs_volume_type
	ebs_volume_size												= var.ebs_volume_size
	ebs_volume_encrypted									= var.ebs_volume_encrypted
	ebs_iops															= var.ebs_iops
	ebs_volume_count											= var.ebs_volume_count
	delete_on_termination									= var.delete_on_termination
	comparison_operator										= var.comparison_operator
	metric_name														= var.metric_name
	evaluation_periods										= var.evaluation_periods
	metric_namespace											= var.metric_namespace
	applying_period												= var.applying_period
	statistic_level												= var.statistic_level
	metric_threshold											= var.metric_threshold
	default_alarm_action									= var.default_alarm_action
	additional_ips_count									= var.additional_ips_count
	permissions_boundary_arn							= var.permissions_boundary_arn
	instance_profile											= var.instance_profile
	instance_initiated_shutdown_behavior	= var.instance_initiated_shutdown_behavior
	root_block_device_encrypted						= var.root_block_device_encrypted
	root_block_device_kms_key_id					= var.root_block_device_kms_key_id
	metadata_http_tokens_required					= var.metadata_http_tokens_required
	metadata_http_endpoint_enabled				= var.metadata_http_endpoint_enabled
	metadata_tags_enabled									= var.metadata_tags_enabled
	metadata_http_put_response_hop_limit	= var.metadata_http_put_response_hop_limit
	kms_key_id														= var.kms_key_id
	volume_tags_enabled										= var.volume_tags_enabled
	ssm_patch_manager_enabled							= var.ssm_patch_manager_enabled
	ssm_patch_manager_iam_policy_arn			= var.ssm_patch_manager_iam_policy_arn
	ssm_patch_manager_s3_log_bucket				= var.ssm_patch_manager_s3_log_bucket

	context 															= module.this.context
}