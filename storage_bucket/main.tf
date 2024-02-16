# Cloud Storage bucket
resource "google_storage_bucket" "main_bucket" {
  name          = "your-bucket-name"
  location      = "us-central1"
  force_destroy = true

  # Configure lifecycle rules
  lifecycle_rule {
    condition {
      age                   = 30
      with_state            = "ANY"
      matches_storage_class = ["STANDARD"]
    }
    action {
      type                  = "SetStorageClass"
      storage_class         = "NEARLINE"
    }
  }

  lifecycle_rule {
    condition {
      age                   = 365
      with_state            = "ANY"
      matches_storage_class = ["STANDARD"]
    }
    action {
      type                  = "SetStorageClass"
      storage_class         = "COLDLINE"
    }
  }

  # Enable versioning
  versioning {
    enabled = true
  }
}
