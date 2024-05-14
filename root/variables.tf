variable "project" {
  default     = "edinbyr"
  type        = string
  description = "GCP project name"
}

variable "env" {
  default     = "test"
  type        = string
  description = "Infrastructure environment type"
}

variable "region" {
  default     = "us-east1"
  type        = string
  description = "VPC region"
}

variable "zone" {
  default     = "us-east1-b"
  type        = string
  description = "Specific zone within the VPC region"
}

variable "subnet_cidr" {
  default     = "10.0.0.0/16"
  type        = string
  description = "The CIDR range for VPC subnetwork"
}

variable "api_names" {
  type        = list(string)
  description = "List of apis to enable"
  default     = ["compute.googleapis.com", "cloudresourcemanager.googleapis.com"]
}

variable "controller_count" {
  default = 3
}

variable "controller_image" {
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "controller_size" {
  default = 100
}

variable "controller_type" {
  default = "n1-standard-1"
}


variable "worker_count" {
  default = 3
}

variable "worker_image" {
  default = "ubuntu-os-cloud/ubuntu-1804-lts"
}

variable "worker_size" {
  default = 100
}

variable "worker_type" {
  default = "n1-standard-1"
}

variable "zone_map" {
  default = {
    "0" = "b"
    "1" = "c"
    "2" = "d"
  }
}
