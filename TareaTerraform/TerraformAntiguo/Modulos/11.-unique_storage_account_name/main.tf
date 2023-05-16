# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = "${var.name}-rg"
  }

  byte_length = var.byte_length
}

resource "random_password" "password" {
  length      = var.length
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