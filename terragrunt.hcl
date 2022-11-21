inputs = {
  parent_folder_id = "folders/33591644343"
}

# creates GCS bucket for storing states
remote_state {
  backend = "gcs"

  config = {
    bucket   = "gcp-terragrunt-demo-1"
    project  = "level-clone-350517"
    location = "us-central1"
    prefix   = path_relative_to_include()
  }

  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
