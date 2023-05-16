resource "azurerm_storage_account" "storage_account" {
  account_replication_type = var.account_replication_type
  account_tier             = var.account_tier
  location                 = var.location_storage_acc
  name                     = var.name_storage_acc
  resource_group_name      = var.resource_group_name_storage_acc
}