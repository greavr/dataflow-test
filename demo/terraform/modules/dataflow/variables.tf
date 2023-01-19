variable "project_id" {}
variable "region" {}
variable "zone" {}
variable "kms_key_name" {}
variable "temp_gcs_location" {}
variable "network" {}
variable "subnet" {}

# Default values
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "dataflow.googleapis.com",
        "autoscaling.googleapis.com",
    ]  
}

variable "parameters" {
  type        = map(string)
  description = "Key/Value pairs to be passed to the Dataflow job (as used in the template)."
  default     = {}
}

variable "max_workers" {
  type        = number
  description = " The number of workers permitted to work on the job. More workers may improve processing speed at additional cost."
  default     = 1
}

variable "on_delete" {
  type        = string
  description = "One of drain or cancel. Specifies behavior of deletion during terraform destroy. The default is cancel."
  default     = "cancel"
}

variable "dataflow-job-name" {
  type        = string
  description = "The name of the dataflow job"
  default = "test-olalekan"
}

variable "machine_type" {
  type        = string
  description = "The machine type to use for the job."
  default     = "n1-standard-1"
}

variable "ip_configuration" {
  type        = string
  description = "The configuration for VM IPs. Options are 'WORKER_IP_PUBLIC' or 'WORKER_IP_PRIVATE'."
  default     = null
}

variable "additional_experiments" {
  type        = list
  description = "The list of additional experiments"
  default = null
}

variable "inputSubscription" {
  type        = string
  description = "Input subscription for dataflow"
  default = null
}

variable "outputTableSpec" {
  type        = string
  description = "The specification of output table"
  default = null
}

variable "gcp_iam_list" {
    description = "List of IAM permission to compute service"
    type    = list(string)
    default =  [
        "roles/dataflow.worker",
        "roles/pubsub.subscriber",
        "roles/bigquery.admin",
        "roles/storage.objectAdmin",
        "roles/logging.logWriter",
        "roles/monitoring.metricWriter",
        "roles/monitoring.dashboardEditor",
        "roles/stackdriver.resourceMetadata.writer",
        "roles/storage.objectViewer"
 ]
}