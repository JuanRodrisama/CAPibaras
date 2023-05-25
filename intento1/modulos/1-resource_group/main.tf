resource "azurerm_resource_group" "rg" {

  location = var.location
  name     = var.name_rg
}