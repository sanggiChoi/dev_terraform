terraform {
  required_version = ">= 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
  }
}

# terraform {
#   required_version = ">= 1.0.0"

#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = ">= 4.9.0"
#     }
#   }
# }