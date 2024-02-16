# Cloud Function for HTTP endpoint
resource "google_cloudfunctions_function" "http_endpoint" {
  name        = "http-endpoint-function"
  runtime     = "python39"
  source_code = "gs://<your_bucket>/http_endpoint_function.zip"
  trigger_http = true
  entry_point = "http_endpoint_handler"

  environment_variables = {
    KMS_KEY = google_kms_crypto_key.key.name
  }
}
