resource "random_id" "random_id" {
  keepers = {

    resource_group = var.resource_group_rid
  }

  byte_length = var.byte_length
}

resource "random_password" "password" {
  length      = var.length_pass
  min_lower   = var.min_lower
  min_upper   = var.min_upper
  min_numeric = var.min_numeric
  min_special = var.min_special
  special     = var.special
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = var.length
}