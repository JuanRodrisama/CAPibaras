resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  resource_name     = "${random_pet.prefix.id}-rg"
}