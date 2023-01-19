// Moving to new file for clarity
// It still behaves as if all in one file (so depends_on works and you can reference the values elsewhere in the module)


# GCE SA
resource "google_service_account" "dataflow-gce-sa" {
    account_id   = "dataflow-gce-sa"
    display_name = "dataflow-gce-sa"
}

# Providing permisison to compute service 
resource "google_project_iam_member" "iam_roles" {
 count   = length(var.gcp_iam_list)
 project = var.project_id
 role = var.gcp_iam_list[count.index]
 member  = "serviceAccount:${google_service_account.dataflow-gce-sa.email}"
 depends_on = [
      google_project_service.enable-services
  ]
}