# This example overrides the module/version defined in root HCL.

include "root" {
  path = find_in_parent_folders()
}

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

terraform {
  source = "git@github.com:choonchernlim/terragrunt-module-poc.git//folder?ref=v2.0.0"
}

inputs = {
  folder_name = "folder-2"
}
