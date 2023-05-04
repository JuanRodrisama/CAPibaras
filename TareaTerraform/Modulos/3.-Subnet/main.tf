resource "azurerm_subnet" "my_terraform_subnet" {
locals {
  subnet_name = "${random_pet.prefix.id}-subnet"
}
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_address_prefixes
}