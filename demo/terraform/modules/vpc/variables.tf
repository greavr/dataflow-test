variable "project_id" {}
variable "region" {}
variable "cidr" {
    default = "10.0.0.0/24"
}

variable "vpc-name" {
    type = string
    description = "Custom VPC Name"
    default = "dataflow-job-vpc"
}

# Service to enable
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "compute.googleapis.com",
        "iam.googleapis.com",
        "iamcredentials.googleapis.com",
        "autoscaling.googleapis.com"
    ]
  
}