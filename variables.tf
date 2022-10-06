variable "environment" {
  description = "Environment"
  type        = string
  default     = "development"
}

variable "google_project_id" {
  description = "google project id"
  type        = string
}

variable "region" {
  description = "region"
  type        = string
}

variable "cloudsql_instance_names" {
  description = "CloudSQL instance name"
  type        = set(string)
}

variable "cloudsql_tier" {
  description = "CloudSQL tier"
  type        = string
}

variable "cloudsql_update_track" {
  description = "CloudSQL update track"
  type        = string
}

variable "cloudsql_database_version" {
  description = "CloudSQL database version"
  type        = string
}

variable "cloudsql_availability_type" {
  description = "CloudSQL availability type"
  type        = string
}

variable "cloudsql_deletion_protection" {
  description = "CloudSQL deletion protection"
  type        = string
}

variable "cloudsql_disk_size" {
  description = "CloudSQL disk size"
  type        = string
}

variable "cloudsql_disk_type" {
  description = "CloudSQL disk type"
  type        = string
}

variable "cloudsql_password" {
  description = "Application password"
  type        = string
  sensitive   = true
}

variable "cloudsql_collation" {
  description = "Database collation"
  type        = string
  default     = "utf8mb4"
}

variable "cloudsql_flags" {
  description = "CloudSQL flags"
  type        = map(string)
  default     = {
    default_time_zone    = "+00:00"
    character_set_server = "utf8mb4"
  }
}
