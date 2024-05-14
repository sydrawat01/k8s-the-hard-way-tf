resource "google_compute_network" "vpc" {
  project                         = var.project
  name                            = "${var.env}-${var.project}-vpc"
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
  mtu                             = 1460
  routing_mode                    = "REGIONAL"
}

resource "google_compute_subnetwork" "k8s_subnet" {
  name          = "${var.env}-${var.project}-subnet"
  ip_cidr_range = var.subnet_cidr
  network       = google_compute_network.vpc.self_link
  region        = var.region
  stack_type    = "IPV4_ONLY"
}
