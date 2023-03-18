resource "google_folder" "child" {
  display_name = "customer-3-child"
  parent       = var.sub_parent_folder_id
}