terraform {
  backend "gcs" {
    bucket = "anwiku-gcp-iac"
    prefix = "terraform/state/gce"
  }
}
