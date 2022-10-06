###################################
# Global settings                 #
###################################
environment       = "test"
region            = "europe-west1" # Belgium
google_project_id = "seated-test-361108"

###################################
# CloudSQL Event instances        #
###################################
cloudsql_instance_names      = ["test-seated-api-"]
cloudsql_database_version    = "MYSQL_8_0"
cloudsql_tier                = "db-n1-standard-1"
cloudsql_availability_type   = "ZONE"
cloudsql_collation           = "utf8mb4_unicode_ci"
cloudsql_disk_size           = "100GB"
cloudsql_disk_type           = "PD_SSD"
cloudsql_update_track        = "canary"
cloudsql_deletion_protection = true
cloudsql_flags               = {
  default_time_zone        = "+00:00"
  character_set_server     = "utf8mb4"
}
