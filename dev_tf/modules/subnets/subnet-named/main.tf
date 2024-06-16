provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

 module  "subnet_named" {
  source 		= "cloudposse/named-subnets/aws"
  version 	= "0.12.0"

	subnet_names										= var.subnet_names
	max_subnets 										= var.max_subnets
	type														= var.type
	availability_zone 							= var.availability_zone
	vpc_id													= var.vpc_id
	cidr_block											= var.cidr_block
	igw_id													= var.igw_id
	ngw_id													= var.ngw_id
	public_network_acl_id 					= var.public_network_acl_id
	private_network_acl_id					= var.private_network_acl_id
	public_network_acl_egress 			= var.public_network_acl_egress
	public_network_acl_ingress			= var.public_network_acl_ingress
	private_network_acl_egress			= var.private_network_acl_egress
	private_network_acl_ingress 		= var.private_network_acl_ingress
	nat_enabled 										= var.nat_enabled
	eni_id													= var.eni_id
	map_public_ip_on_launch_enabled = var.map_public_ip_on_launch_enabled

	context 												= module.this.context
 }