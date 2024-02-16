# Main Terraform configuration file

# Providers
provider "google" {
  credentials = var.credentials_file_path
  project     = var.project_id
  region      = var.region
}

# Modules
module "scheduled_job" {
  source     = "./scheduled_job"
  project_id = var.project_id
}

module "http_endpoint" {
  source     = "./http_endpoint"
  project_id = var.project_id
}

module "optional_rate_limiting" {
  source     = "./rate_limiting"
  project_id = var.project_id
}

module "monitoring" {
  source           = "./monitoring"
  project_id       = var.project_id
  notification_email = var.notification_email
}

module "disaster_recovery" {
  source     = "./disaster_recovery"
  project_id = var.project_id
}

module "storage_bucket" {
  source     = "./storage_bucket"
  project_id = var.project_id
}
