include {
  path = find_in_parent_folders()
}

terraform {
  source = "git@github.com:choonchernlim/terragrunt-module-poc.git//folder?ref=v1.0.0"
}

inputs = {
  folder_name = "folder-1"
}
