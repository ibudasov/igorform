###################################
# Global settings                 #
###################################
environment       = "production"
region            = "europe-west1" # Belgium
google_project_id = "seated-production"

###################################
# CloudSQL Event instances        #
###################################
cloudsql_instance_names      = ["production-seated-api-"]
cloudsql_database_version    = "MYSQL_8_0"
cloudsql_tier                = "db-n1-highmem-8"
cloudsql_availability_type   = "REGIONAL"
cloudsql_collation           = "utf8mb4_unicode_ci"
cloudsql_disk_size           = "250GB"
cloudsql_disk_type           = "PD_SSD"
cloudsql_update_track        = "stable"
cloudsql_deletion_protection = true
cloudsql_flags               = {
  default_time_zone        = "+00:00"
  character_set_server     = "utf8mb4"
}
