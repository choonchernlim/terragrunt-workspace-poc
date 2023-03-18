# This example contains TF resource(s) that requires output from another module.

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

dependency "folder" {
  config_path = "../folder"

  # to satisfy dynamic dependency if dependent module is not provisioned yet
  mock_outputs = {
    folder_id = "mock_folder_id"
  }
}

inputs = {
  sub_parent_folder_id = dependency.folder.outputs.folder_id
}