# Red virtual
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name_rg}-vnet"
  address_space       = var.address_space
  location            = var.location
  resource_group_name = var.name_rg
}

# Subred
resource "azurerm_subnet" "subnet" {
  name                 = "${var.name_rg}-subnet"
  resource_group_name  = var.name_rg
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefixes
}