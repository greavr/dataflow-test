# ----------------------------------------------------------------------------------------------------------------------
# CTD Required
# ----------------------------------------------------------------------------------------------------------------------
variable "project_id" {
  type        = string
  description = "project id required"
}
variable "project_name" {
  type        = string
  description = "project name in which demo deploy"
  default = ""
}
variable "project_number" {
  type        = string
  description = "project number in which demo deploy"
  default = ""
}
variable "gcp_account_name" {
  description = "user performing the demo"
  default = ""
}
variable "deployment_service_account_name" {
  description = "Cloudbuild_Service_account having permission to deploy terraform resources"
  default = ""
}
variable "org_id" {
  description = "Organization ID in which project created"
  default = ""
}
variable "data_location" {
  type        = string
  description = "Location of source data file in central bucket" 
  default = ""
}
variable "secret_stored_project" {
    type        = string
    description = "Project where secret is accessing from"
    default = ""
}

# ----------------------------------------------------------------------------------------------------------------------
# Data Flow Variables
# ----------------------------------------------------------------------------------------------------------------------
variable "region" {
  type        = string
  description = "The region in which the created job should run. Also determines the location of the staging bucket if created."
  default     = "us-central1"
}

variable "zone" {
  type        = string
  description = "The zone in which the created job should run."
  default     = "us-central1-a"
}

variable "kms_key_name" {
  type        = string
  description = "The name for the Cloud KMS key for the job. Key will be created"
  default     = "dataflow"
}

variable "gcs_bucket_name" {
  type        = string
  description = "GCS Bucket name used by dataflow, terraform will insert the project name at the start, e.g. var.project_id-var.gcs_bucket_name"
  default     = "dataflow-job"
}