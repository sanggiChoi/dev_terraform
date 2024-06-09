provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

module "vpc" {
  source                            = "cloudposse/vpc/aws"
  version                           = "2.1.1"

  ipv4_primary_cidr_block                   = var.ipv4_primary_cidr_block
  ipv4_primary_cidr_block_association       = var.ipv4_primary_cidr_block_association
  ipv4_additional_cidr_block_associations   = var.ipv4_additional_cidr_block_associations
  ipv4_cidr_block_association_timeouts      = var.ipv4_cidr_block_association_timeouts
  assign_generated_ipv6_cidr_block          = var.assign_generated_ipv6_cidr_block
  ipv6_primary_cidr_block_association       = var.ipv6_primary_cidr_block_association
  ipv6_additional_cidr_block_associations   = var.ipv6_additional_cidr_block_associations
  ipv6_cidr_block_association_timeouts      = var.ipv6_cidr_block_association_timeouts
  ipv6_cidr_block_network_border_group      = var.ipv6_cidr_block_network_border_group
  instance_tenancy                          = var.instance_tenancy
  dns_hostnames_enabled                     = var.dns_hostnames_enabled
  dns_support_enabled                       = var.dns_support_enabled
  default_security_group_deny_all           = var.default_security_group_deny_all
  default_route_table_no_routes             = var.default_route_table_no_routes
  default_network_acl_deny_all              = var.default_network_acl_deny_all
  internet_gateway_enabled                  = var.internet_gateway_enabled
  ipv6_egress_only_internet_gateway_enabled = var.ipv6_egress_only_internet_gateway_enabled
  network_address_usage_metrics_enabled     = var.network_address_usage_metrics_enabled

	context 																	= module.this.context
}