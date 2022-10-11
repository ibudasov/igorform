resource "google_sql_database_instance" "instance" {
  region               = var.region
  name                 = var.cloudsql_instance_name
  master_instance_name = "master"
  database_version     = var.cloudsql_database_version
  deletion_protection  = var.cloudsql_deletion_protection

  replica_configuration {
    failover_target        = true
    connect_retry_interval = 30
  }

  settings {
    tier              = var.cloudsql_tier
    pricing_plan      = "PER_USE"
    activation_policy = "ALWAYS"

    # Disk
    disk_autoresize = true
    disk_size       = var.cloudsql_disk_size
    disk_type       = var.cloudsql_disk_type

    # High Available
    availability_type = "REGIONAL"

    maintenance_window {
      update_track = var.cloudsql_update_track
      day          = 1
      hour         = 3
    }

    backup_configuration {
      enabled                        = true
      binary_log_enabled             = true
      location                       = "eu"
      start_time                     = "04:00"
      transaction_log_retention_days = 7

      backup_retention_settings {
        retention_unit   = "COUNT"
        retained_backups = 14
      }
    }

    insights_config {
      query_insights_enabled  = true
      query_string_length     = 1024
      record_application_tags = true
    }

    password_validation_policy {
      enable_password_policy      = true
      disallow_username_substring = true
      min_length                  = 36
    }

    ip_configuration {
      ipv4_enabled = true
      require_ssl  = true
      #private_network = "projects/${var.google_project_id}/global/networks/${var.authorized_network}"

      authorized_networks {
        name  = "Office Breda"
        value = "31.169.58.161/32"
      }

      authorized_networks {
        name  = "VCF Breda"
        value = "85.119.50.65/32"
      }

      authorized_networks {
        name  = "VCF Eindhoven"
        value = "85.119.51.65/32"
      }

      authorized_networks {
        name  = "VCF Rijen"
        value = "188.94.186.241/32"
      }
    }

    user_labels = {
      team = "Ticketing - Seated"
    }

    dynamic "database_flags" {
      iterator = flag
      for_each = var.cloudsql_flags

      content {
        name  = flag.key
        value = flag.value
      }
    }
  }
}

