variable "project_id" {
    type = string
}

variable "region" {
    type = string
}

variable "networks" {
    type = string
}

variable "subnets" {
    type = string
}

variable "gcs" {
    type = string
}

variable "environment" {
    type = string
}

variable "key_name" {
    type = string
}

variable "gce" {
  type = list(object({
    name                    = string
    //network_name            = string
    labels                 = map(string)
    tags                   = list(string)
    machine_type           = string
    zone                   = string
    image         = string
    size          = string
    type          = string
    auto_delete = bool
    tier = string
  }))
}