output "vpc" {
  value = google_compute_network.demo-vpc
}

output "subnets" {
    value = google_compute_subnetwork.subnet
}