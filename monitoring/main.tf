# Configure Stackdriver Monitoring
resource "google_monitoring_notification_channel" "alert_channel" {
  display_name = "alert-channel"
  type         = "email"
  labels = {
    email_address = var.notification_email
  }

  # Configuration for alerting...
}

# Define custom alert policies
resource "google_monitoring_alert_policy" "high_latency" {
  display_name = "High Latency Alert"
  conditions {
    display_name = "High Latency Condition"
    condition_threshold {
      filter     = "metric.type=\"http/server/response_latencies\" AND resource.type=\"cloud_function\""
      comparison = "COMPARISON_GT"
      threshold_value = "1000.0"
      duration       = "60s"
      aggregations {
        alignment_period = "60s"
        per_series_aligner = "ALIGN_RATE"
        cross_series_reducer = "REDUCE_MEAN"
      }
      trigger {
        count = 1
      }
    }
  }
  notification_channels = [google_monitoring_notification_channel.alert_channel.name]
}
