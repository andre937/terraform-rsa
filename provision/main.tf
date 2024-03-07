module "gce" {
  source = "../../modules"

  project_id       = var.project_id
  region           = var.region
  networks         = var.network_name
  subnets          = var.subnets
  gcs              = var.gcs
  gce              = var.gce
  key_name         = var.key_name
  environment      = var.environment
}