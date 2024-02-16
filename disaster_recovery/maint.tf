# Configure multi-region replication for Cloud Storage bucket
resource "google_storage_bucket" "disaster_recovery" {
  name          = "disaster-recovery-bucket"
  location      = "us-central1"
  force_destroy = true

  # Configure multi-region replication
  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }

  lifecycle_rule {
    condition {
      age = 365
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }

  # Enable versioning
  versioning {
    enabled = true
  }
}
