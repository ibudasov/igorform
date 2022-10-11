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
