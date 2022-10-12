resource "google_cloud_run_service" "default" {
  name     = "seated-api-workload"
  location = "europe-west4"

  template {
    spec {
      containers {
        image = "us-docker.pkg.dev/cloudrun/container/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
  # Waits for the Cloud Run API to be enabled
 depends_on = [google_project_service.run_api, google_project_service.gcp_resource_manager_api]
}

# Enables the Cloud Run API
resource "google_project_service" "run_api" {
 service = "run.googleapis.com"

 disable_on_destroy = true
}

resource "google_project_service" "gcp_resource_manager_api" {
  project = "igorform"
  service = "cloudresourcemanager.googleapis.com"
  disable_on_destroy = true
}

resource "time_sleep" "gcp_wait_crm_api_enabling" {
  depends_on = [
    google_project_service.gcp_resource_manager_api
  ]

  create_duration = "1m"
}

# public access
data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}

# Display the service URL
output "service_url" {
  value = google_cloud_run_service.default.status[0].url
}
