
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
    bucket          = "jk-dev-s3-tf"
    key             = "prd/${path_relative_to_include()}/tf.tfstate"
    region          = "ap-northeast-2"
    dynamodb_table  = "jk-dev-dynamodb-tf"
  }
}