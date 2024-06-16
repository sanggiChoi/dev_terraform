output "ngw_id" {
  value       = module.subnet_named.ngw_id
  description = "NAT Gateway ID"
}

output "ngw_private_ip" {
  value       = module.subnet_named.ngw_private_ip
  description = "Private IP address of the NAT Gateway"
}

output "ngw_public_ip" {
  value       = module.subnet_named.ngw_public_ip
  description = "Public IP address of the NAT Gateway"
}

output "subnet_ids" {
  value       = module.subnet_named.subnet_ids
  description = "Subnet IDs"
}

output "route_table_ids" {
  value       = module.subnet_named.route_table_ids
  description = "Route table IDs"
}

output "named_subnet_ids" {
  description = "Map of subnet names to subnet IDs"

  value = module.subnet_named.named_subnet_ids
}