provider "aws" {
  region = var.aws_region
}

 terraform {
   # The configuration for this backend will be filled in by Terragrunt
   backend "s3" {}
 }

module "ecs" {
  source                            = "cloudposse/ecs-cluster/aws"
  version                           = "0.6.1"

  container_insights_enabled        = var.container_insights_enabled
  kms_key_id                        = var.kms_key_id
  logging                           = var.logging
  log_configuration                 = var.log_configuration
  capacity_providers_fargate        = var.capacity_providers_fargate
  capacity_providers_fargate_spot   = var.capacity_providers_fargate_spot
  capacity_providers_ec2            = var.capacity_providers_ec2
  external_ec2_capacity_providers   = var.external_ec2_capacity_providers
  default_capacity_strategy         = var.default_capacity_strategy
  service_discovery_namespace_arn   = var.service_discovery_namespace_arn
  context 													= module.this.context
}
