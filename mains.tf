terraform {
  backend "gcs" {
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.39.0"
    }
  }
}

provider "google" {
  project = var.google_project_id
  region  = var.region
}

module "iam" {
  source     = "./modules/iam"
  project_id = var.google_project_id
}

module "cloudsql" {
  source             = "./modules/cloud_sql"
  project_id         = var.google_project_id
  region             = var.region
  tier               = var.cloudsql_tier
  availability_type  = var.cloudsql_availability_type
  database_version   = var.cloudsql_database_version
  for_each           = var.cloudsql_instance_names
  instance_name      = each.value
}
