// Added in more lineral dependencies, firewall depends on VPC, VPC depends on enabled apis. Terraform is great at working out the order it needs

# Enable API's
resource "google_project_service" "enable-services" {
  for_each = toset(var.services_to_enable)

  project = var.project_id
  service = each.value
  disable_on_destroy = false
}

# VPC
resource "google_compute_network" "demo-vpc" {
 name = var.vpc-name    
 project = var.project_id          
 auto_create_subnetworks = false

 depends_on = [
   google_project_service.enable-services
 ]
}
 
# Firewalls
resource "google_compute_firewall" "default" {
   
 name    = "test-firewall"
 network = google_compute_network.demo-vpc.name
 project= var.project_id
 allow {
   protocol = "icmp"
 }
 
 allow {
   protocol = "tcp"
   ports    = ["80", "8080", "1000-2000", "12345-12346"]
 }
 source_tags = ["web"]
 
 depends_on = [
   google_compute_network.demo-vpc
 ]
}

# Create region specific subnet
resource "google_compute_subnetwork" "subnet" {
  name = "${var.region}"
  ip_cidr_range =  "${var.cidr}"       
  region        = "${var.region}"
  network       = google_compute_network.demo-vpc.name
}
