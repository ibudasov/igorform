provider "google" {
  credentials = "${file("creds.json")}"
  project = "igorform"
  region = "europe-west4"
}
