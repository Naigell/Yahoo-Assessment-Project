variable "project_id" {
  description = "The ID of the GCP project."
  default     = "yahoo_assessment"
}

variable "region" {
  description = "The GCP region."
  default     = "us-central1"
}

variable "notification_email" {
  description = "Email address for Stackdriver alert notifications."
  default     = "cloud-team@yahoo.com"
}

variable "credentials_file_path" {
  description = "File path to the service account key file."
  default     = "<path_to_service_account_key_file>"
}