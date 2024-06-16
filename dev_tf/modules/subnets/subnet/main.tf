provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

 module  "subnet" {
  source 		= "cloudposse/multi-az-subnets/aws"
  version 	= "0.15.0"

	availability_zones						= var.availability_zones
	max_subnets										= var.max_subnets
	type													= var.type
	vpc_id												= var.vpc_id
	cidr_block										= var.cidr_block
	igw_id												= var.igw_id
	az_ngw_ids										= var.az_ngw_ids
	public_network_acl_id					= var.public_network_acl_id
	private_network_acl_id				= var.private_network_acl_id
	public_network_acl_egress			= var.public_network_acl_egress
	public_network_acl_ingress		= var.public_network_acl_ingress
	private_network_acl_egress		= var.private_network_acl_egress
	private_network_acl_ingress		= var.private_network_acl_ingress
	nat_gateway_enabled						= var.nat_gateway_enabled
	ipv6_enabled									= var.ipv6_enabled
	ipv6_cidr_block								= var.ipv6_cidr_block

	context 											= module.this.context
 }