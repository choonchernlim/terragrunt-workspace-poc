resource "google_folder" "child" {
  display_name = "terragrunt_demo_child"
  parent       = var.parent_folder_id
}