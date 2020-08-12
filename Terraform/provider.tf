provider "google" {
  credentials = file("credentials.json")
  region = var.region
  project = var.project
}