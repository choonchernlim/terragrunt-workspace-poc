# This example uses the module/version defined in root HCL.

include "root" {
  path = find_in_parent_folders()
}

include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

inputs = {
  folder_name = "folder-1"
}
