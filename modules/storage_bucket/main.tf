resource "google_storage_bucket" "storage_bucket" {
  location                    = var.region
  name                        = var.name
  project                     = var.project_id
  storage_class               = "STANDARD"
  force_destroy               = false
  uniform_bucket_level_access = true
}
