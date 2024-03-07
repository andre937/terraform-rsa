data "google_compute_network" "network" {
  name    = var.networks
  project = var.project_id
}

data "google_compute_subnetwork" "subnetwork" {
  name    = var.subnets
  project = var.project_id
  region  = var.region
}