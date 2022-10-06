###################################
# Global settings                 #
###################################
environment       = "development"
region            = "europe-west1" # Belgium
google_project_id = "seated-test-361108"

###################################
# CloudSQL Event instances        #
###################################
cloudsql_instance_names      = ["development-seated-api-"]
cloudsql_database_version    = "MYSQL_8_0"
cloudsql_tier                = "db-g1-small"
cloudsql_availability_type   = "ZONE"
cloudsql_collation           = "utf8mb4_unicode_ci"
cloudsql_disk_size           = "50GB"
cloudsql_disk_type           = "PD_HDD"
cloudsql_update_track        = "canary"
cloudsql_deletion_protection = false
cloudsql_flags               = {
  default_time_zone        = "+00:00"
  character_set_server     = "utf8mb4"
}
