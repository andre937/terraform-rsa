locals {
    gces = { for r in var.gce : r.name => r }
}