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

#data "google_iam_policy" "noauth" {
#  binding {
#    role = "roles/run.invoker"
#    members = [
#      "allUsers",
#    ]
#  }
#}
#
#resource "google_cloud_run_service_iam_policy" "noauth" {
#  location    = google_cloud_run_service.default.location
#  project     = google_cloud_run_service.default.project
#  service     = google_cloud_run_service.default.name
#
#  policy_data = data.google_iam_policy.noauth.policy_data
#}