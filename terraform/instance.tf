# A single Compute Engine instance
resource "google_compute_instance" "nginx" {
  name         = "crew"
  machine_type = "e2-medium"
  zone         = "europe-west2-a"

  boot_disk {
    initialize_params {
      image = local.image
    }
  }

  network_interface {
    network = local.network
    access_config {}
  }
  tags = ["http-server"]
}