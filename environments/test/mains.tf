module "cloud_sql" {
  source                       = "../../modules/data/cloud_sql"
  environment                  = var.environment
  region                       = var.region
  google_project_id            = var.google_project_id
  cloudsql_tier                = var.cloudsql_tier
  cloudsql_instance_name       = var.cloudsql_instance_name
  cloudsql_database_version    = var.cloudsql_database_version
  cloudsql_update_track        = var.cloudsql_update_track
  cloudsql_availability_type   = var.cloudsql_availability_type
  cloudsql_deletion_protection = var.cloudsql_deletion_protection
  cloudsql_disk_size           = var.cloudsql_disk_size
  cloudsql_disk_type           = var.cloudsql_disk_type
  cloudsql_password            = var.cloudsql_password
  cloudsql_flags               = var.cloudsql_flags
}
