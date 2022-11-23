include {
  path = find_in_parent_folders()
}

# Example of overriding parent's configuration
terraform {
  source = "git@github.com:choonchernlim/terragrunt-module-poc.git//folder?ref=v2.0.0"
}

inputs = {
  folder_name = "folder-2"
}
