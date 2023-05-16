# Create storage account for boot diagnostics
resource "azurerm_storage_account" "my_storage_account" {
  name_storage_account     = "diag${var.name}"
  location                 = var.resource_group_location
  resource_group_name      = "${var.name}-rg"
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
}