
terraform {
  extra_arguments "-var-file" {
    commands = get_terraform_commands_that_need_vars()

    optional_var_files = [
      "${find_in_parent_folders("globals.tfvars", "ignore")}",
      "${find_in_parent_folders("locals.tfvars", "ignore")}"
    ]
  }
}

remote_state {
  backend = "s3"

  config = {
    encrypt         = true
    bucket          = "dev-apne2-terraform-s3"
    key             = "prd/${path_relative_to_include()}/terraform.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "dev-apne2-terraform-dynamodb"
  }
}