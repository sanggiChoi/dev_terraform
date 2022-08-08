output "name" {
  value       = module.role.name
  description = "The name of the IAM role created"
}

output "id" {
  value       = module.role.id
  description = "The stable and unique string identifying the role"
}

output "arn" {
  value       = module.role.arn
  description = "The Amazon Resource Name (ARN) specifying the role"
}

output "policy" {
  value       = module.role.policy
  description = "Role policy document in json format. Outputs always, independent of `enabled` variable"
}

output "instance_profile" {
  description = "Name of the ec2 profile (if enabled)"
  value       = module.role.instance_profile
}