output "vpc" {
  value = google_compute_network.vpc
}

output "subnet" {
  value = google_compute_subnetwork.k8s_subnet
}
