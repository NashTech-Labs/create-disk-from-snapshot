resource "google_compute_resource_policy" "knoldus_snapshot_policy" {
  name   = "knoldus-snapshot-policy"
  region = "europe-west2"
  snapshot_schedule_policy {
    schedule {
      daily_schedule {
        days_in_cycle = "1"
        start_time    = "13:00"
      }
    }
    retention_policy {
      max_retention_days    = "10"
      on_source_disk_delete = "KEEP_AUTO_SNAPSHOTS"
    }
    snapshot_properties {
    #   labels            = local.labels
      storage_locations = ["eu"]
    }
  }
}

resource "google_compute_region_disk_resource_policy_attachment" "knoldus_snapshot_policy_regional_attachment" {
  name   = google_compute_resource_policy.knoldus_snapshot_policy.name
  disk   = "knoldus-region-disk"
  region = "europe-west2"
}