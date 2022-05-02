terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.13.0"
    }
  }
}

provider "google" {
  # Configuration options
  project     = local.project_id
  region      = "europe-west2"
  zone        = "europe-west2a"
  credentials = "keys.json"
}