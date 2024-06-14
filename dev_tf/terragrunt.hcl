
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
    bucket          = "dev-job-uswe2-tf-s3"
    key             = "prd/${path_relative_to_include()}/tf.tfstate"
    region          = "us-west-2"
    dynamodb_table  = "dev-job-uswe2-tf-dynamodb"
  }
}