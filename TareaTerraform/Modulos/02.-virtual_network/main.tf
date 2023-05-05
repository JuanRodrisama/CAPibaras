# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name_vnet           = "${var.name}-vnet"
  address_space       = var.address_space
  location            = var.resource_group_location
  resource_group_name = "${var.name}-rg"
}