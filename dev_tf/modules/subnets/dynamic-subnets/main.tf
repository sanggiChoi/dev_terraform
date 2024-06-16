provider "aws" {
  region = var.aws_region
}

 terraform {
  # The configuration for this backend will be filled in by Terragrunt
  backend "s3" {}
}

module "dynamic-subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.2"
  # insert the 1 required variable here

  vpc_id = var.vpc_id
	igw_id = var.igw_id
	ipv6_egress_only_igw_id = var.ipv6_egress_only_igw_id
	max_subnet_count = var.max_subnet_count
	max_nats = var.max_nats
	private_subnets_enabled = var.private_subnets_enabled
	public_subnets_enabled = var.public_subnets_enabled
	private_label = var.private_label
	public_label = var.public_label
	ipv4_enabled = var.ipv4_enabled
	ipv6_enabled = var.ipv6_enabled
	ipv4_cidr_block = var.ipv4_cidr_block
	ipv6_cidr_block = var.ipv6_cidr_block
	ipv4_cidrs = var.ipv4_cidrs
	ipv6_cidrs = var.ipv6_cidrs
	availability_zones = var.availability_zones
	availability_zone_ids = var.availability_zone_ids
	availability_zone_attribute_style = var.availability_zone_attribute_style
	nat_gateway_enabled = var.nat_gateway_enabled
	nat_instance_enabled = var.nat_instance_enabled
	nat_elastic_ips = var.nat_elastic_ips
	map_public_ip_on_launch = var.map_public_ip_on_launch
	private_assign_ipv6_address_on_creation	= var.private_assign_ipv6_address_on_creation
	public_assign_ipv6_address_on_creation = var.public_assign_ipv6_address_on_creation
	private_dns64_nat64_enabled = var.private_dns64_nat64_enabled
	public_dns64_nat64_enabled = var.public_dns64_nat64_enabled
	ipv4_private_instance_hostname_type = var.ipv4_private_instance_hostname_type
	ipv4_private_instance_hostnames_enabled = var.ipv4_private_instance_hostnames_enabled
	ipv6_private_instance_hostnames_enabled = var.ipv6_private_instance_hostnames_enabled
	ipv4_public_instance_hostname_type = var.ipv4_public_instance_hostname_type
	ipv4_public_instance_hostnames_enabled = var.ipv4_public_instance_hostnames_enabled
	ipv6_public_instance_hostnames_enabled = var.ipv6_public_instance_hostnames_enabled
	private_open_network_acl_enabled = var.private_open_network_acl_enabled
	public_open_network_acl_enabled = var.public_open_network_acl_enabled
	open_network_acl_ipv4_rule_number = var.open_network_acl_ipv4_rule_number
	open_network_acl_ipv6_rule_number = var.open_network_acl_ipv6_rule_number
	private_route_table_enabled = var.private_route_table_enabled
	public_route_table_ids = var.public_route_table_ids
	public_route_table_enabled = var.public_route_table_enabled
	public_route_table_per_subnet_enabled = var.public_route_table_per_subnet_enabled
	route_create_timeout = var.route_create_timeout
	route_delete_timeout = var.route_delete_timeout
	subnet_create_timeout = var.subnet_create_timeout
	subnet_delete_timeout = var.subnet_delete_timeout
	private_subnets_additional_tags = var.private_subnets_additional_tags
	public_subnets_additional_tags = var.public_subnets_additional_tags
	subnets_per_az_count = var.subnets_per_az_count
	subnets_per_az_names = var.subnets_per_az_names
	nat_instance_type = var.nat_instance_type
	nat_instance_ami_id = var.nat_instance_ami_id
	nat_instance_cpu_credits_override = var.nat_instance_cpu_credits_override
	metadata_http_endpoint_enabled = var.metadata_http_endpoint_enabled
	metadata_http_put_response_hop_limit = var.metadata_http_put_response_hop_limit
	metadata_http_tokens_required = var.metadata_http_tokens_required
	nat_instance_root_block_device_encrypted = var.nat_instance_root_block_device_encrypted
	context = module.this.context
}