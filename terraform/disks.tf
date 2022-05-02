## KNOLDUS DISK
resource "google_compute_region_disk" "knoldus_regiondisk" {
  count                     = "1"
  name                      = var.REGION_DISK_NAME
  snapshot                  = data.external.snapshot_latest.result.knoldus_snapshot_latest
  type                      = "pd-ssd"
  region                    = var.DISK_REGION
  size                      = var.DISK_SIZE
  physical_block_size_bytes = 4096

  replica_zones = [var.DISK_REPLICA_ZONE_1,var.DISK_REPLICA_ZONE_2]
}

resource "google_compute_attached_disk" "knoldus_regiondisk" {
  count       = "1"
  depends_on  = [google_compute_region_disk.knoldus_regiondisk]
  device_name = var.REGION_DISK_NAME
  disk        = "projects/${var.GCP_PROJECT_ID}/regions/${var.DISK_REGION}/disks/${var.REGION_DISK_NAME}"
  instance    = google_compute_instance.nginx.id
}

resource "google_compute_attached_disk" "knoldus_regiondisk_manual" {
  count       = "1"
  device_name = var.REGION_DISK_NAME
  disk        = "projects/${var.GCP_PROJECT_ID}/regions/${var.DISK_REGION}/disks/${var.REGION_DISK_NAME}"
  instance    = google_compute_instance.nginx.id
}

data "external" "snapshot_latest" {
  program = ["/bin/sh", "../scripts/get-latest-snapshot.sh"]
}

output "latest_snapshots" {
  value = data.external.snapshot_latest.result
}