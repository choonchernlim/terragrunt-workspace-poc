# Don't treat root HCL as a module
skip = true

terraform {
  # Module/version to be applied to all child modules
  source = "git@github.com:choonchernlim/terragrunt-module-poc.git//folder?ref=v1.0.0"

  # Expose env-based vars as TF_VAR_* for child modules to consume
  extra_arguments "vars" {
    commands           = get_terraform_commands_that_need_vars()
    required_var_files = ["${get_parent_terragrunt_dir()}/tfvars/${get_env("ENVIRONMENT")}.tfvars"]
  }
}