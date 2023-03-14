# Read env-based config
locals {
  config = yamldecode(file("${get_repo_root()}/env/${get_env("ENVIRONMENT")}.yml"))
}

# Module and its version to be applied to all customers
terraform {
  source = "git@github.com:choonchernlim/terragrunt-module-poc.git//folder?ref=v1.0.0"
}

# GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    bucket   = local.config.backend.bucket
    project  = local.config.backend.project
    location = local.config.backend.location
    prefix   = path_relative_to_include()
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# Don't run at root hcl (ie: don't set up backend, etc)
skip = true

# variables to be injected to all child modules
inputs = {
  parent_folder_id = local.config.parent_folder_id
}
