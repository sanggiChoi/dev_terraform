output "az_subnet_ids" {
  value       = module.subnet.az_subnet_ids
  description = "Map of AZ names to subnet IDs"
}

output "az_subnet_arns" {
  value       = module.subnet.az_subnet_arns
  description = "Map of AZ names to subnet ARNs"
}

output "az_subnet_cidr_blocks" {
  value       = module.subnet.az_subnet_cidr_blocks
  description = "Map of AZ names to subnet CIDR blocks"
}

output "az_subnet_ipv6_cidr_blocks" {
  value       = module.subnet.az_subnet_ipv6_cidr_blocks
  description = "Map of AZ names to subnet IPv6 CIDR blocks"
}

output "az_route_table_ids" {
  value       = module.subnet.az_route_table_ids
  description = " Map of AZ names to Route Table IDs"
}

output "az_ngw_ids" {
  # No ellipsis needed since this module makes either public or private subnets. See the TF 0.15 one function
  value       = module.subnet.az_ngw_ids
  description = "Map of AZ names to NAT Gateway IDs (only for public subnets)"
}

output "az_subnet_map" {
  value       = module.subnet.az_subnet_map
  description = "Map of AZ names to map of information about subnets"
}