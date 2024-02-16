# Cloud Function for scheduled job
resource "google_cloudfunctions_function" "scheduled_job" {
  name        = "scheduled-job-function"
  runtime     = "python39"
  source_code = "gs://<your_bucket>/scheduled_job_function.zip"
  trigger_http = true
  entry_point = "scheduled_job_handler"

  environment_variables = {
    KMS_KEY = google_kms_crypto_key.key.name
  }
}

# Cloud Scheduler trigger
resource "google_cloud_scheduler_job" "scheduled_job_trigger" {
  name        = "scheduled-job-trigger"
  description = "Trigger for scheduled job"
  schedule    = "*/10 * * * *"
  http_target {
    uri = google_cloudfunctions_function.scheduled_job.https_trigger_url
    http_method = "POST"
  }
}
