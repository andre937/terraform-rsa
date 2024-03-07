output "gce" {
  value = [for name in keys(module.gce.gce) : name]
}