variable "project_id" {
    type = string
    default = "root-414402"
}

variable "region" {
    type = string
    default = "us-central1"
}

variable "network_name" {
    type = string
    default = "vpc-anwiku"
}

variable "subnets" {
    type = string
    default = "subnet-gke"
}

variable "environment" {
    type = string
    default = "ssh-keys"
}

variable "key_name" {
    type = string
    default = "gitlab"
}

variable "gcs" {
    type = string
    default = "anwiku-gcp-iac"
}

variable "gce" {
  type = list(object({
    name                    = string
    labels                 = map(string)
    tags                   = list(string)
    machine_type           = string
    zone                   = string
    image         = string
    size          = string
    type          = string
    auto_delete = bool
  }))
  default = [
    {
        name = "gce-testing"
        labels = {
            "gce" = "staging"
        }
        tags = ["gce"]
        machine_type = "n2d-custom-2-4096"
        zone = "us-central1-b"
        image = "debian-cloud/debian-12"
        size = "30"
        type         = "pd-ssd"
        auto_delete  = true
    }
  ]
}