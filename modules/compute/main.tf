resource "google_compute_instance" "controller" {
  count        = var.controller_count
  name         = "controller-${count.index}"
  machine_type = var.controller_type #e2-standard-2
  zone         = "${var.region}-${lookup(var.zone_map, count.index)}"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.controller_image
      size  = var.controller_size
      labels = {
        os   = "debian"
        type = "controller-compute-instance"
      }
    }
  }

  network_interface {
    network    = var.vpc.name
    subnetwork = var.subnet.name
    access_config {}
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["controller-${count.index}", "allow-http"]
}

resource "google_compute_instance" "worker" {
  count        = var.worker_count
  name         = "worker-${count.index}"
  machine_type = var.worker_type #e2-standard-2
  zone         = "${var.region}-${lookup(var.zone_map, count.index)}"

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.worker_image
      size  = var.worker_size
      labels = {
        os   = "debian"
        type = "worker-compute-instance"
      }
    }
  }

  network_interface {
    network    = var.vpc.name
    subnetwork = var.subnet.name
    access_config {}
  }

  service_account {
    scopes = ["cloud-platform"]
  }

  tags = ["${var.env}-worker-${count.index}", "allow-http"]
}
