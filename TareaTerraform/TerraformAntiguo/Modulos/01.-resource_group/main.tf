resource "azurerm_resource_group" "rg" {
  location          = var.resource_group_location
  resource_name     = "${var.name}-rg"
}