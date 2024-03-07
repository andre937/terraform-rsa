module "ssh-keypair" {
  source = "../../modules/gce/tls"

  env      = var.environment
  tls-name = var.key_name
  gcs      = var.gcs
}

resource "google_compute_instance" "instance" {
  for_each     = local.gces
  name         = each.value.name
  labels       = each.value.labels
  tags         = each.value.tags
  machine_type = each.value.machine_type
  zone         = each.value.zone
  project      = var.project_id

  boot_disk {
    initialize_params {
      image = each.value.image
      size  = each.value.size
      type  = each.value.type
    }
    auto_delete = each.value.auto_delete
  }

  network_interface {
    network            = data.google_compute_network.network.self_link
    subnetwork         = data.google_compute_subnetwork.subnetwork.self_link
    access_config {
      network_tier = each.value.tier
    }
  }
  metadata = {
    ssh-keys = "${var.key_name}:${module.ssh-keypair.public}"
  }

  service_account {
    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    //email  = google_service_account.default.email
    scopes = ["cloud-platform"]
  }

}