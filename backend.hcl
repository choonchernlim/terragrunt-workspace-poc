# Don't treat root HCL as a module
skip = true

# GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    project  = get_env("TF_BACKEND_PROJECT")
    bucket   = get_env("TF_BACKEND_BUCKET")
    location = get_env("TF_BACKEND_LOCATION")

    # Git repo name as prefix to prevent possible path collision when multiple git repos point to the same bucket
    prefix = "${basename(get_parent_terragrunt_dir())}/${path_relative_to_include()}"
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

terraform {
  # Force Terraform to keep trying to acquire a lock for up to 20 minutes if someone else already has the lock
  extra_arguments "retry_lock" {
    commands  = get_terraform_commands_that_need_locking()
    arguments = ["-lock-timeout=20m"]
  }

  # Force Terraform to run with reduced parallelism
  extra_arguments "parallelism" {
    commands  = get_terraform_commands_that_need_parallelism()
    arguments = ["-parallelism=5"]
  }
}