# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name_storage_account     = var.name_storage_account
  location                 = var.location
  resource_group_name      = var.resource_group_name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}