terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.39.0"
    }
  }

  backend "gcs" {
    bucket = "seated-test-terraform"
#    prefix = "state"
  }
}

provider "google" {
  project = var.google_project_id
  region  = var.region
}
