variable "project_id" {}
# Keyring name
variable "kms-name" {}

# Service to enable
variable "services_to_enable" {
    description = "List of GCP Services to enable"
    type    = list(string)
    default =  [
        "secretmanager.googleapis.com",
        "cloudkms.googleapis.com",
        "kmsinventory.googleapis.com"
    ]
}