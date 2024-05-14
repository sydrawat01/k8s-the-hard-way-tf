module "services" {
  source    = "../modules/services"
  project   = var.project
  api_names = var.api_names
}

resource "time_sleep" "enabling_apis" {
  depends_on      = [module.services]
  create_duration = "30s"
}

module "network" {
  source      = "../modules/network/"
  region      = var.region
  project     = var.project
  subnet_cidr = var.subnet_cidr
  env         = var.env
}

module "compute" {
  source           = "../modules/compute"
  vpc              = module.network.vpc
  subnet           = module.network.subnet
  controller_count = var.controller_count
  controller_image = var.controller_image
  controller_size  = var.controller_size
  controller_type  = var.controller_type
  worker_count     = var.worker_count
  worker_image     = var.worker_image
  worker_size      = var.worker_size
  worker_type      = var.worker_type
  region           = var.region
  zone_map         = var.zone_map
  env              = var.env
}

module "firewall" {
  source = "../modules/firewall"
  env    = var.env
  vpc    = module.network.vpc
}
