# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

# Create Dataflow Job
resource "google_dataflow_job" "dataflow_job" {
  project               = var.project_id
  region                = var.region
  zone                  = var.zone
  name                  = var.dataflow-job-name
  on_delete             = var.on_delete
  max_workers           = var.max_workers
  template_gcs_path     = "gs://${var.temp_gcs_location}/"
  temp_gcs_location     = "gs://${var.temp_gcs_location}/tmp_dir"
  parameters            = var.parameters
  service_account_email = google_service_account.dataflow-gce-sa.email
  network               = var.network
  subnetwork            = var.subnet
  machine_type          = var.machine_type
  ip_configuration      = var.ip_configuration
  kms_key_name          = var.kms_key_name

  depends_on = [
    google_project_service.enable-services,
    google_service_account.dataflow-gce-sa
  ]
}