# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

# Create key-chain
resource "google_kms_key_ring" "keyring" {
  name     = var.kms-name
  location = "global"
}

resource "google_kms_crypto_key" "dataflow-key" {
  name            = "dataflow-key"
  key_ring        = google_kms_key_ring.keyring.id
  rotation_period = "100000s"

  lifecycle {
    prevent_destroy = true
  }
}