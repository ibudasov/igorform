provider "google" {
  credentials = "${file("creds.json")}"
  project = "seated-test-361108"
  region = "europe-west4"
}
