resource "google_compute_firewall" "k8s_firewall" {
  name      = "${var.env}-k8s-firewall"
  network   = var.vpc.name
  direction = "INGRESS"

  allow {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}
