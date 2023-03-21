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

# Generates versions.tf for all child modules
generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"

  contents = <<EOF
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.0"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
EOF
}

