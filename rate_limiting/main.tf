# Cloud Endpoints for rate limiting
resource "google_endpoints_service" "rate_limiting" {
  name = "rate-limiting-service"
  config_id = "2022-02-14r0"
  producer_project_id = var.project_id

  # Configure rate limiting
  quota {
    limit       = "1000"
    metric      = "serviceruntime.googleapis.com/api/consumer/quota_used_count"
    unit        = "1/min/{project}"
    display     = "Global requests per minute"
    allow_below = "true"
  }

  # Define backend services
  backend {
    rules {
      selector        = "service_control"
      address         = "https://servicecontrol.googleapis.com"
      deadline        = "30s"
      disable_logging = false
    }
  }

  # Define endpoints
  endpoints {
    name                 = "endpoints"
    allow_cors           = "true"
    allow_methods        = ["GET", "POST"]
    allow_origins        = ["*"]
    allow_headers        = ["*"]
    disable_auth         = "true"
    disable_idle_timeout = "true"
    script               = "gcp.endpoints.esp_v2.ESPv2(service=\"service-endpoint.project_id.cloud.goog\", configs=[{\"name\":\"endpoints_config\"}])"
    location             = "us-central1"
    security_level       = "SECURE"
  }
}
