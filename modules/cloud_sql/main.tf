resource "google_sql_database_instance" "instance" {
  region              = var.region
  name                = var.cloudsql_instance_names
  database_version    = var.cloudsql_database_version
  deletion_protection = var.cloudsql_deletion_protection

  replica_configuration {
    failover_target        = true
    connect_retry_interval = 30
    master_instance_name   = "master"
  }

  settings {
    tier              = var.cloudsql_tier
    update_track      = var.cloudsql_update_track
    pricing_plan      = "PER_USE"
    activation_policy = "ALWAYS"

    # Disk
    disk_autoresize = true
    disk_size       = var.cloudsql_disk_size
    disk_type       = var.cloudsql_disk_type

    # High Available
    binary_log_enabled   = true
    availability_type    = "REGIONAL"
    master_instance_name = "master"

    maintenance_window {
      day  = 1
      hour = 3
    }

    backup_configuration {
      enabled                        = true
      point_in_time_recovery_enabled = true
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

resource "google_sql_database" "database" {
  instance  = "${google_sql_database_instance.instance.name}"
  name      = "seated_ticketing"
  charset   = "utf8mb4"
  collation = "utf8mb4_unicode_ci"
}

resource "google_sql_user" "users" {
  instance = "${google_sql_database_instance.instance.name}"
  name     = "app-seated-api"
  password = var.cloudsql_password
  host     = "%"
}
